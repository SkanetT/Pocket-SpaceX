//
//  RocketPresenter.swift
//  Pocket SpaceX
//
//  Created by Антон on 08.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class RocketPresenter: RocketPresenterInput {
    
    private weak var viewController: RocketPresenterOutput?
    let router: RocketRouting
    
    init(_ router: RocketRouting) {
        self.router = router
    }
    
    func attach(_ viewController: RocketPresenterOutput) {
        self.viewController = viewController
    }
    
    func closeTap() {
        router.dismiss()
    }
}
