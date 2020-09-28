//
//  LaunchpadInfoPresenterInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 28.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchpadInfoPresenterInput: class {
    func attach(_ viewController: LaunchpadInfoPresenterOutput)
    func viewDidLoad()
    func closeTap()
}
