//
//  MovieMemberDetails.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 20/08/21.
//

import Foundation

struct MovieMemberDetails : Codable{
     
    var gender:Int?
    var original_name :String?
    var known_for_department:String?
    var profile_path:String?
    
    enum CodingKeys : String , CodingKey {
        case gender
        case original_name
        case known_for_department
        case profile_path
    }
    
    init(from decoder: Decoder) throws {
        
        //Got the main container from the json data this consist of all the value
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //Decode all the data
        gender = try container.decode(Int.self, forKey: .gender)
        original_name = try container.decode(String.self, forKey: .original_name)
        known_for_department = try container.decode(String.self, forKey: .known_for_department)
        if let profile_path =  try container.decodeIfPresent(String.self, forKey: .profile_path) {
            self.profile_path  = profile_path
        }
        else {
            self.profile_path = nil
        }
        
        
    }
}
