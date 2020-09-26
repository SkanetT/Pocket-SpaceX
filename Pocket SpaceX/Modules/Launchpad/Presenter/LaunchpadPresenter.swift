//
//  LaunchpadPresenter.swift
//  Pocket SpaceX
//
//  Created by Антон on 26.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class LaunchpadPresenter: LaunchpadPresenterInput {
    
    private weak var viewController: LaunchpadPresenterOutput?
    
    let router: LaunchpadRouting
    
    init(_ router: LaunchpadRouting) {
        self.router = router
    }
    
    func attach(_ viewController: LaunchpadPresenterOutput) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        
    }
    
    func closeTap() {
        router.dismiss()
    }
    
}
