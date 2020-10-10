//
//  SpaceXService.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class SpaceXService: SpaceXServiceProtocol {
    func fetchLaunchs(completion: @escaping (Result<LaunchData, ApiErrors>) -> Void) {
        let request = LaunchRequest()
        NetworkApi.shared.sendRequest(request: request, completion: completion)
    }
    
    func fetchNextLaunch(completion: @escaping (Result<LaunchDatum, ApiErrors>) -> Void) {
        let request = NextLaunchRequest()
        NetworkApi.shared.sendRequest(request: request, completion: completion)
    }
    
    func fetchStarlink(completion: @escaping (Result<StarlinkData, ApiErrors>) -> Void) {
        let request = StarlinkRequest()
        NetworkApi.shared.sendRequest(request: request, completion: completion)
    }
    
}
