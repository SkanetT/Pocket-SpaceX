//
//  LaunchpadRouting.swift
//  Pocket SpaceX
//
//  Created by Антон on 26.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

protocol LaunchpadRouting: RoutingError, RoutingDismiss {
    func launchpadInfoPresent(id: String)
}
