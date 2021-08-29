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
                        completion: @escaping (Result<User , Error>) -> Void){
        
    }
    
    public func signOut(){
        
    }
  
    
    
}
