//
//  CreditsDetails.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 20/08/21.
//

import Foundation
struct CreditsDetails : Codable {
    
    var cast : [MovieMemberDetails]?
    var crew : [MovieMemberDetails]?
    
    enum CodingKeys : String , CodingKey {
        case cast
        case crew
    }
    
    init(from decoder: Decoder) throws {
        
        //Got the main container from the json data this consist of all the value
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.cast = try container.decode([MovieMemberDetails].self, forKey: .cast)
            self.crew = try container.decode([MovieMemberDetails].self, forKey: .crew)
        
    }
    
    
}
