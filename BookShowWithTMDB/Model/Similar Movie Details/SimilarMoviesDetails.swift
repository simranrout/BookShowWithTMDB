//
//  SimilarMoviesDetails.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import Foundation
struct SimilarMoviesDetails : Codable{
     
    var release_date:String = ""
    var original_title :String = ""
    var original_language:String = ""
    var poster_path:String?
    
    enum CodingKeys : String , CodingKey {
        case release_date
        case original_title
        case original_language
        case poster_path
    }
    
    init(from decoder: Decoder) throws {
        //Got the main container from the json data this consist of all the value
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //Decode all the data
        release_date = try container.decode(String.self, forKey: .release_date)
        original_title = try container.decode(String.self, forKey: .original_title)
        let languagecode = try container.decode(String.self, forKey: .original_language)
        original_language = Locale.current.localizedString(forLanguageCode: languagecode) ?? languagecode
        if let profile_path =  try container.decodeIfPresent(String.self, forKey: .poster_path) {
            self.poster_path  = profile_path
        }
        else {
            self.poster_path = nil
        }
    }
}
