//
//  StorageManager.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 27/08/21.
//


import Foundation
import FirebaseStorage

//Making it singleton class
final class StorageManager {
    
    //creating Instance
    static let shared = StorageManager()
    
    //Making Initializer Private
    private init(){}
    
    let storage = Storage.storage().reference()
    
    public func uploadProfilePicture(userName: String , data: Data? , completion: @escaping (Bool) -> Void){
        guard  let data = data else {
            return
        }
        storage.child("\(userName)/profilepicture.png").putData(data, metadata: nil) { _, error in
            print("issues", error)
            completion(error == nil)
        }
    }
}
