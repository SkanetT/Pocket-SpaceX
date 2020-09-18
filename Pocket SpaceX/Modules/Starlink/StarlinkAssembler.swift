//
//  StarlinkAssembler.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class StarlinkAssembler {
    
    static func createModule() -> UIViewController {
        let viewController = StarlinkController()
        let router = StarlinkRouter(viewController)
        let interactor = StarlinkInteractor()
        let presenter = StarlinkPresenter(interactor, router)
        viewController.presenter = presenter
        let tableHandler = StarlinkTableHandler()
        viewController.tableHandler = tableHandler
        return viewController
    }
    
    
}
