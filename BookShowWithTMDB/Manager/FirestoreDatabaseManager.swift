//
//  FirestoreDatabaseManager.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 27/08/21.
//

import Foundation
import FirebaseFirestore

//Making it singleton class
final class FirestoreDatabaseManager {
    
    //creating Instance
    static let shared = FirestoreDatabaseManager()
    
    //Making Initializer Private
    private init(){}
    
    let firestore = Firestore.firestore()
    
    
    public func createUser(newUser: UserCredential , completion: @escaping (Bool)-> Void) {
        //create reference
        let reference = firestore.document("Users/\(newUser.userName)")
        reference.setData(newUser.convertToDictionary()) { errorOcuured in
            print("issues", errorOcuured , newUser.convertToDictionary())
            completion(errorOcuured == nil)
        }
    }
}
