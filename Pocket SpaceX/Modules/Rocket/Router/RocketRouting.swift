//
//  RocketRouting.swift
//  Pocket SpaceX
//
//  Created by Антон on 08.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol RocketRouting: RoutingError {
    func dismiss()
    func rocketInfoPresent(id: String)
}
