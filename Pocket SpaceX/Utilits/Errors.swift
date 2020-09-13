//
//  Errors.swift
//  Pocket SpaceX
//
//  Created by Антон on 07.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

enum ApiErrors: Error {
    case statusCode(_ id: Int)
    case noData
    case network
    case parsing
    case unknown
    case noInternet
    
    var description: String {
        switch self {
        case .noInternet:
            return "No Internet connection"
        case .unknown:
            return "Unknown error (2)"
        case .noData:
            return "No data"
        case .parsing:
            return "Parsing"
        default:
            return "Unknown error"
        }
    }
}
