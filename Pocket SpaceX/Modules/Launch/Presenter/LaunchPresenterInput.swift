//
//  LaunchPresenterInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchPresenterInput: class {
    func attach(_ viewController: LaunchPresenterOutput)
    func viewDidLoad()
    func sideMenuTap()
    func reverseTap()
    func launchTypeChange(_ type: LaunchType)
    func refreshData()
}
