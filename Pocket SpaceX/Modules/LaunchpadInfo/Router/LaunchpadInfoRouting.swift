//
//  LaunchpadInfoRouting.swift
//  Pocket SpaceX
//
//  Created by Антон on 27.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchpadInfoRouting {
    func dismiss()
    func showError(_ error: ApiErrors)
    func needRefresh(refresh: (() -> ())?)
}
