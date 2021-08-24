//
//  SimilarMoviesResponse.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import Foundation
struct SimilarMoviesResponse : Codable {
    var results : [SimilarMoviesDetails]?
    
    enum CodingKeys : String , CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
            //Got the main container from the json data this consist of all the value
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.results = try container.decode([SimilarMoviesDetails].self, forKey: .results)
    }
}
