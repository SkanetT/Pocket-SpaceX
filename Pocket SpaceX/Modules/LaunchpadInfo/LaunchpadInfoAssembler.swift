//
//  LaunchpadInfoAssembler.swift
//  Pocket SpaceX
//
//  Created by Антон on 27.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchpadInfoAssembler {
    
    static func createModule(launchpadId: String) -> UIViewController {
        let viewController = LaunchpadInfoController()
        let interactor = LaunchpadInfoInteractor(id: launchpadId)
        let router = LaunchpadInfoRouter(viewController)
        let presenter = LaunchpadInfoPresenter(interactor, router)
        viewController.presenter = presenter
        let mapHandler = LaunchpadInfoMapHandler()
        viewController.mapHandler = mapHandler
        
        return viewController
    }
}
