//
//  SimilarMoviesDetails.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 24/08/21.
//

import Foundation

struct SimilarMoviesDetails: Codable{
    var release_date: String
    var original_title: String
    var original_language: String
    var poster_path: String?
}