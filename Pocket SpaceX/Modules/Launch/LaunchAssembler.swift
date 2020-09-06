//
//  LaunchAssembler.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchAssembler {
    
    static func createModule(delegate: MenuDelegate) -> UIViewController {
        let viewController = LaunchController()
        let router = LaunchRouter(viewController)
        router.delegate = delegate
        let presenter = LaunchPresenter(router)
        viewController.presenter = presenter
        return viewController
    }
}
