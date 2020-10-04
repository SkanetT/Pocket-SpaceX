//
//  LaunchInteractorOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 13.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchInteractorOutput: class {
    func launchDataSuccess(_ data: LaunchData)
    func launchDataFailure(_ error: ApiErrors)
    func nextLaunchIdSuccess(_ id: String)
}
