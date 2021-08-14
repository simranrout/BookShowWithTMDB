//
//  MoviesModel.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 14/08/21.
//

import Foundation
struct MovieModel : Decodable{
     
    var original_title = ""
    var overview = ""
    var poster_path:String?
    var vote_average = 0.0
    var release_date = ""
    var original_language = ""
    
    
    enum CodingKeys : String , CodingKey {
        case original_title
        case overview
        case vote_average
        case poster_path
        case release_date
        case original_language
         
    }
    
    
    
    init(from decoder: Decoder) throws {
    //Got the main container from the json data this consist of all the value
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //Decode all the data
        original_title = try container.decode(String.self, forKey: .original_title)
        overview = try container.decode(String.self, forKey: .overview)
        vote_average = try container.decode(Double.self, forKey: .vote_average)
        release_date = try container.decode(String.self, forKey: .release_date)
        original_language = try container.decode(String.self, forKey: .original_language)
        poster_path = try container.decode(String.self, forKey: .poster_path)
        
//    print(original_language , original_title , overview , poster_path  , release_date , vote_average )
        
    }
}

 
