//
//  SpaceXServiceProtocol.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol SpaceXServiceProtocol {
    func fetchLaunchs(completion: @escaping (Result<LaunchData, ApiErrors>) -> Void)
    func fetchNextLaunch(completion: @escaping (Result<LaunchDatum, ApiErrors>) -> Void)
    func fetchStarlink(completion: @escaping (Result<StarlinkData, ApiErrors>) -> Void)
    func fetchRockets(completion: @escaping (Result<RocketData, ApiErrors>) -> Void)
    func fetchRocketInfo(_ rocketId: String, completion: @escaping (Result<RocketDatum, ApiErrors>) -> Void)
    func fetchLauchpads(completion: @escaping (Result<LaunchpadData, ApiErrors>) -> Void)
    func fetchLauchpadInfo(_ lauchpadId: String, completion: @escaping (Result<LaunchpadDatum, ApiErrors>) -> Void)
}
