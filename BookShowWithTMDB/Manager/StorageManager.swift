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
    
    let storage = Storage.storage()
}
