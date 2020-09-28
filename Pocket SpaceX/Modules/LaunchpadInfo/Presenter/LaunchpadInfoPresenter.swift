//
//  LaunchpadInfoPresenter.swift
//  Pocket SpaceX
//
//  Created by Антон on 28.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class LaunchpadInfoPresenter: LaunchpadInfoPresenterInput {
    
    private weak var viewController: LaunchpadInfoPresenterOutput?
    let interactor: LaunchpadInfoInteractorInput
    let router: LaunchpadInfoRouting
    
    init(_ interactor: LaunchpadInfoInteractorInput, _ router: LaunchpadInfoRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    func attach(_ viewController: LaunchpadInfoPresenterOutput) {
        self.viewController = viewController
        interactor.attach(self)
    }
    
    func viewDidLoad() {
        interactor.fecthData()
        router.needRefresh() { [weak self] () in
            self?.interactor.fecthData()
        }
    }
    
    func closeTap() {
        router.dismiss()
    }
    
}

extension LaunchpadInfoPresenter: LaunchpadInfoInteractorOutput {
    func launchpadInfoDataSuccess(_ data: LaunchpadDatum) {
        viewController?.didReceiveLaunchpadInfoData(data)
    }
    
    func launchpadInfoDataFailure(_ error: ApiErrors) {
        router.showError(error)
    }
    
}
