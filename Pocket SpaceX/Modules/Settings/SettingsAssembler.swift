//
//  SettingsAssembler.swift
//  Pocket SpaceX
//
//  Created by Антон on 29.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class SettingsAssembler {
    
    static func createModule() -> UIViewController {
        let viewController = SettingsController()
        let router = SettingsRouter(viewController)
        let interactor = SettingsInteractor()
        let presenter = SettingsPresenter(interactor, router)
        
        viewController.presenter = presenter
        
        return viewController
    }
    
}
