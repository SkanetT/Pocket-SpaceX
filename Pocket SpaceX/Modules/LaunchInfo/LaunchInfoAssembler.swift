//
//  LaunchInfoAssembler.swift
//  Pocket SpaceX
//
//  Created by Антон on 15.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchInfoAssembler {
    
    static func createModule(data: LaunchDatum) -> UIViewController {
        let viewController = LaunchInfoController()
        let interactor = LaunchInfoInteractor(data)
        let router = LaunchInfoRouter(viewController)
        let presenter = LaunchInfoPresenter(interactor, router)
        let youtubeHandler = LaunchInfoYoutubeHandler()
        
        viewController.youtubeHandler = youtubeHandler
        viewController.presenter = presenter
        return viewController
    }
}
