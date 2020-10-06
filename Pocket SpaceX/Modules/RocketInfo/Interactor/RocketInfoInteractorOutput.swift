//
//  RocketInfoInteractorOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol RocketInfoInteractorOutput: class {
    func rocketInfoDataSuccess(_ data: RocketDatum)
    func rocketInfoDataFailure(_ error: ApiErrors, isFirstError: Bool)
}
