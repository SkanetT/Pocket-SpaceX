//
//  SpaceXService.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class SpaceXService: SpaceXServiceProtocol {
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
    
    func fetchRockets(completion: @escaping (Result<RocketData, ApiErrors>) -> Void) {
        let request = RocketRequest()
        NetworkApi.shared.sendRequest(request: request, completion: completion)
    }
    
    func fetchRocketInfo(_ rocketId: String, completion: @escaping (Result<RocketDatum, ApiErrors>) -> Void) {
        let request = RocketInfoRequest(id: rocketId)
        NetworkApi.shared.sendRequest(request: request, completion: completion)
    }
    
    func fetchLauchpads(completion: @escaping (Result<LaunchpadData, ApiErrors>) -> Void) {
        let request = LaunchpadRequest()
        NetworkApi.shared.sendRequest(request: request, completion: completion)
    }
    
    func fetchLauchpadInfo(_ lauchpadId: String, completion: @escaping (Result<LaunchpadDatum, ApiErrors>) -> Void) {
        let request = LaunchpadInfoRequest(id: lauchpadId)
        NetworkApi.shared.sendRequest(request: request, completion: completion)
    }
}
