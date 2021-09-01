//
//  MoviesModel.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 14/08/21.
//

import Foundation

struct MovieModel: Codable {

    var original_title: String
    var overview: String
    var poster_path: String?
    var vote_average: Double
    var release_date: String
    var original_language: String
    var id: Int
    var backdrop_path: String?
    var genre_ids: [Int]
    var thumbnailURL: String {
        guard let profilePath = poster_path else {
            return ""
        }
        return Constants.thumbnailURL + ImageSize.MovieTableViewImageSize + profilePath
    }
}

 
