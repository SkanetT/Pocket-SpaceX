//
//  BaseRequest.swift
//  Pocket SpaceX
//
//  Created by Антон on 07.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol BaseRequestProtocol  {
    associatedtype response: Decodable
    var urlRequest: URLRequest? { get }
}

class BaseRequest<T: Decodable>: BaseRequestProtocol {
    
    typealias response = T
    
    var path: String {
        return ""
    }
    
    var urlRequest: URLRequest? {
        var comp = URLComponents()
        comp.scheme = "https"
        comp.host = "api.spacexdata.com"
        comp.path = self.path
        guard let url = comp.url else { return nil }
        let request = URLRequest(url: url)
        return request
    }
}
