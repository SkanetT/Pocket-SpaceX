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
    case timeOut
    
    var description: String {
        switch self {
        case .noInternet:
            return "No connection"
        case .unknown:
            return "Unknown error"
        case .noData:
            return "No data"
        case .parsing:
            return "Parsing"
        case .timeOut:
            return "Time Out"
        case .statusCode(let id):
            return "Error \(id)"
        default:
            return "Unknown error (2)"
        }
    }
}
