//
//  GenreCaching.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 26/08/21.
//

import Foundation

class GenreCaching{
    
    static var genreCache = [Int:String]()
    
    static func setGenreData(_ id: Int , _ genre: String){
        
        genreCache[id] = genre
        
    }
    
    static func getImageFromCache(_ id: Int) -> String{
        return genreCache[id] ?? "N/A"
    }
    static func cleanGenreCache(){
        genreCache.removeAll()
    }
}

