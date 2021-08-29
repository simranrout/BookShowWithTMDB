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
}
