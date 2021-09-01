//
//  AuthenticationManager.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 27/08/21.
//

import Foundation
import FirebaseAuth

//Making it singleton class
final class AuthenticationManager {
    
    //creating Instance
    static let shared = AuthenticationManager()
    let authentication = Auth.auth()
    
    //This property will be true if current user not nil or there is an active user
    public var isSignedIn : Bool{
        authentication.currentUser != nil
        
    }
    
    //Making Initializer Private
    private init(){
        
    }
    
    public func signIn(email: String ,
                       password: String ,
                       completion: @escaping (Result<User , Error>) -> Void){
        
    }
    
    public func signUp( userName: String,
                        email: String ,
                        password: String ,
                        profilePicture: Data?,
                        completion: @escaping (Result<UserCredential , AuthError>) -> Void){
        
        let newUser = UserCredential(userName: userName, emailID: email )
        //Create an new account
        authentication.createUser(withEmail: email, password: password) { authData, errorOccured in
            guard authData != nil && errorOccured == nil else {
                completion(.failure(AuthError.other(errorOccured?.localizedDescription ?? "There is some issue in adding a new user")))
                return
            }
            //adding user credential into firestore
            FirestoreDatabaseManager.shared.createUser(newUser: newUser){success in
                if success{
                    StorageManager.shared.uploadProfilePicture(userName: userName, data: profilePicture) { success in
                        if success{
                            completion(.success(newUser))
                        }
                        else{
                            completion(.failure(AuthError.newUserCreation(errorOccured?.localizedDescription ?? "There is some issue in adding a new user")))
                        }
                    }
                }
            }
        }
    }
    
    public func signOut(completion: @escaping (Bool) -> Void){
        do{
            try authentication.signOut()
            completion(true)
        }
        
        catch{
            print(error)
            completion(false)
        }
    }
}

enum AuthError: Error {
    case newUserCreation(String)
    case other(String)
    
    var description: String {
        switch self {
        case .newUserCreation(let value):
            return value
        case .other(let value):
            return value
    }
    }
}
