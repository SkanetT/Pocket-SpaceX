//
//  RocketInfoPresenter.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class RocketInfoPresenter: RocketInfoPresenterInput {
    
    private weak var viewController: RocketInfoPresenterOutput?
    let interactor: RocketInfoInteractorInput
    let router: RocketInfoRouting

    init(_ interactor: RocketInfoInteractorInput, _ router: RocketInfoRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    func attach(_ viewController: RocketInfoPresenterOutput) {
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

extension RocketInfoPresenter: RocketInfoInteractorOutput {
    
    func rocketInfoDataSuccess(_ data: RocketDatum) {
        viewController?.didReceiveRocketInfoData(data)
    }
    
    func rocketInfoDataFailure(_ error: ApiErrors) {
        router.showError(error)
    }
}