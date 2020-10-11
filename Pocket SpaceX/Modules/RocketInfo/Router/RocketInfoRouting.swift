//
//  RocketInfoRouting.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol RocketInfoRouting: RoutingError, RoutingDismiss {
    func presentWiki(_ url: String)
}
