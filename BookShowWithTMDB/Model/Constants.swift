//
//  Constants.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 14/08/21.
//

import Foundation

struct Constants {
    static let apiKey = "314b902cc56238b2a9a202c8734e5d8c"
    static var request = "now_playing"
    static var base_URL = "https://api.themoviedb.org/3/movie/"
    static var thumbnailURL = "https://image.tmdb.org/t/p/"
    static var movieDetails_URL = "\(request)?api_key=\(apiKey)&page="
    static var credit_URL = "/credits?api_key=\(apiKey)&language=en-US"
    static var trailer_URL = "https://www.youtube.com/watch?v="
    static var similarMovie_URL = "/similar?api_key=\(apiKey)&language=en-US&page=1"
   
}

struct ImageSize {
    static var MovieTableViewImageSize = "w154"
    static var MovieDetailViewImageSize = "w780"
}
