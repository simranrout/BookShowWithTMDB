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
    static var API_URL = "https://api.themoviedb.org/3/movie/\(Request)?api_key=\(API_Key)&page=1"
    static var thumbnailURL = "https://image.tmdb.org/t/p/w154//"
    static var MoviePrototypeCellID = "MovieDetailsCell"
}
