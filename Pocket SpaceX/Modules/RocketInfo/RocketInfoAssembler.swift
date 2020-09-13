//
//  RocketInfoAssembler.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class RocketInfoAssembler {
    
    static func createModule(rocketId: String) -> UIViewController {
        let viewController = RocketInfoController()
        let tableHandler = RocketInfoTableHandler()
        viewController.tableHandler = tableHandler
        let interactor = RocketInfoInteractor(id: rocketId)
        let router = RocketInfoRouter(viewController)
        let presenter = RocketInfoPresenter(interactor, router)
        
        viewController.presenter = presenter
        
        return viewController
    }
}
