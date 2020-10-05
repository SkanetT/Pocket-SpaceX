//
//  LaunchRouting.swift
//  Pocket SpaceX
//
//  Created by Антон on 07.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchRouting {
    func showSideMenu()
    func showError(_ error: ApiErrors)
    func removeError()
    func needRefresh(refresh: (() -> ())?)
    func presentLaunchInfo(_ data: LaunchDatum)
}
