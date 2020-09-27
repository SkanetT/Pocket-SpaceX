//
//  LaunchpadAssembler.swift
//  Pocket SpaceX
//
//  Created by Антон on 26.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchpadAssembler {
    
    static func createModule() -> UIViewController {
        let viewController = LaunchpadController()
        let router = LaunchpadRouter(viewController)
        let interactor = LaunchpadInteractor()
        let presenter = LaunchpadPresenter(interactor, router)
        viewController.presenter = presenter
        let tableHandler = LaunchpadTableHandler()
        viewController.tableHandler = tableHandler
        return viewController
    }
}
