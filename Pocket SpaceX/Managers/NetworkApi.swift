//
//  NetworkApi.swift
//  Pocket SpaceX
//
//  Created by Антон on 07.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class NetworkApi {
    
    static let shared = NetworkApi()
    
    func dataTask<Request: BaseRequestProtocol> (request: Request, completion: @escaping ((Result<Request.response, ApiErrors>) -> ()) ) {
        guard Reachability.shared.isConnectedToNetwork() else {
            completion(.failure(.noInternet))
            return
        }
        guard let req = request.urlRequest else {
            completion(.failure(.unknown))
            return
        }
        URLSession.shared.dataTask(with: req) { (data, response, error) in
            guard let responseCode = response as? HTTPURLResponse else {
                completion(.failure(.unknown))
                return
            }
            switch responseCode.statusCode {
            case 200...300:
                if let data = data, let res = try? JSONDecoder().decode(Request.response.self, from: data) {
                    completion(.success(res))
                } else {
                    completion(.failure(.parsing))
                }
            case 404:
                completion(.failure(.noData))
            default:
                completion(.failure(.statusCode(responseCode.statusCode)))
            }
            
        }.resume()
    }
    
}
