//
//  LaunchPresenter.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class LaunchPresenter: LaunchPresenterInput {
    
    private weak var viewController: LaunchPresenterOutput?
    let router: LaunchRouting

    init(_ router: LaunchRouting) {
        self.router = router
    }
    
    func attach(_ viewController: LaunchPresenterOutput) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
//        let request = RocketRequest()
//        NetworkApi.shared.dataTask(request: request) { result in
//            switch result {
//            case.success(let data):
//                print(data)
//            case.failure(let error):
//                print(error)
//            }
//        }
    }
    
    func sideMenuTap() {
        router.showSideMenu()
    }
}
