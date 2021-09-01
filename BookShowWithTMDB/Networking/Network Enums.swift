//
//  Network Enums.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 27/08/21.
//

import Foundation
enum NetworkError:  Error, Equatable {
    case badRequest
    case unauthorized
    case unknown
    case noJSONData
    case JSONDecoder
    case other(String)
    
    var description: String {
        switch self {
        case .badRequest:
            return "Bad request"
        case .unauthorized:
            return "Unauthorized access"
        case .unknown:
            return "Something went wrong"
        case .noJSONData:
            return "No data returned from the server"
        case .JSONDecoder:
            return "The data cannot be read because it isn't in the correct format"
        case .other(let value):
            return value
        }
    }
    
}


enum MovieApiCallStatus {
    
    case loading
    case loadingCompleted
    case errorOccured(NetworkError?)
    
}
