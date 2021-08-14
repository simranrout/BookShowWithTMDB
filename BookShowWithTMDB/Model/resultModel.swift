//
//  resultModel.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 14/08/21.
//

import Foundation
struct resultModel : Decodable {
    
    var results : [MovieModel]?
    
    enum CodingKeys : String , CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        
        //Got the main container from the json data this consist of all the value
          let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([MovieModel].self, forKey: .results)
        
    }
    
    
}
