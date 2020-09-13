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
        let interactor = LaunchInteractor()
        let router = LaunchRouter(viewController)
        router.delegate = delegate
        let presenter = LaunchPresenter(interactor, router)
        let tableHandler = LaunchTableHandler()
        let searchHandler = LaunchSearchHandler()
        viewController.presenter = presenter
        viewController.tableHandler = tableHandler
        viewController.searchHandler = searchHandler
        return viewController
    }
}
