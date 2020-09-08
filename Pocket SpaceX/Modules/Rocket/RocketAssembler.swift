//
//  RocketAssembler.swift
//  Pocket SpaceX
//
//  Created by Антон on 08.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class RocketAssembler {
    
    static func createModule() -> UIViewController {
        let viewController = RocketController()
        let router = RocketRouter(viewController)
        let presenter = RocketPresenter(router)
        viewController.presenter = presenter
        
        return viewController
    }
}
