//
//  Constants.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 14/08/21.
//

import Foundation
struct Constants {
    static let API_Key = "314b902cc56238b2a9a202c8734e5d8c"
    static var Request = "now_playing"
    static var base_URL = "https://api.themoviedb.org/3/movie/"
    static var thumbnailURL = "https://image.tmdb.org/t/p/"
    static var MovieDetails_URL = "\(Request)?api_key=\(API_Key)&page=1"
    static var MoviePrototypeCellID = "MovieTableViewCell"
    static var credit_URL = "/credits?api_key=\(API_Key)&language=en-US"
   
}

struct ImageSize{
    
    static var MovieTableViewImageSize = "w154"
    static var MovieDetailViewImageSize = "w780"
    
    
}
