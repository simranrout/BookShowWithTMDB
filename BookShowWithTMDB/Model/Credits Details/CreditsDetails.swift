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
}
