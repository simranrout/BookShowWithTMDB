//
//  MovieMemberDetails.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 20/08/21.
//

import Foundation

struct MovieMemberDetails: Codable {
    var gender: Int
    var original_name: String
    var known_for_department: String
    var profile_path: String?
}
