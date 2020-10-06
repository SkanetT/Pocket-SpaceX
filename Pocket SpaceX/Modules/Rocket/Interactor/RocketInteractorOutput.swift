//
//  RocketInteractorOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 10.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol RocketInteractorOutput: class {
    func rocketDataSuccess(_ data: RocketData)
    func rocketDataFailure(_ error: ApiErrors, isFirstError: Bool)
}
