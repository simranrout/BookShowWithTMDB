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
    var profileURL: String {
        guard let profilePath = profile_path else {
            return ""
        }
        return Constants.thumbnailURL + ImageSize.MovieTableViewImageSize + profilePath
    }
    
    var genderName: String {
        if gender == 1{
            return "Female"
        }
        else if gender == 2{
            return "Male"
        }
        else{
           return "Others"
        }
    }

}
