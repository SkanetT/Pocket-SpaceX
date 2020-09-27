//
//  LaunchpadPresenterInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 26.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchpadPresenterInput: class {
    func attach(_ viewController: LaunchpadPresenterOutput)
    func viewDidLoad()
    func closeTap()
}