//
//  GenreParsing.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 25/08/21.
//

import Foundation
class GenreParsing {
    
    
    var jsonData: GenreContainer?
    func genreJSONParse(){
        guard GenreCaching.genreCache.count == 0 else{
            return
        }
        guard let path = Bundle.main.path(forResource: "Genre", ofType: "json") else {
            return
        }
        
        let url = URL(fileURLWithPath: path)
        do {
            let genreJSONData = try Data(contentsOf: url)
            jsonData = try JSONDecoder().decode(GenreContainer.self, from: genreJSONData)
            for genre in jsonData!.genres{
                GenreCaching.setGenreData(genre.id, genre.name)
            }
        }
        catch{
            
        }
    }
    
    static func getGenresFromList(_ id: [Int]) -> String {
        var genreStringList = [String]()
        for genreId in id {
            genreStringList.append(GenreCaching.getImageFromCache(genreId))
        }
        return genreStringList.joined(separator: " * ") 
        
    }
    
}
