//
//  GenreModel.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 25/08/21.
//

import Foundation
struct GenreModel: Codable {
    var id: Int
    var name: String
}

struct GenreContainer: Codable {
    var genres: [GenreModel]
}
