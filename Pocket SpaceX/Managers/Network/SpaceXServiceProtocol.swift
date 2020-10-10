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

}
