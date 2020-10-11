//
//  RocketInfoPresenter.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class RocketInfoPresenter: RocketInfoPresenterInput {
    
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
        viewController?.configureUI()
        interactor.fetchData(isFirstError: true)
        router.needRefresh() { [weak self] () in
            self?.interactor.fetchData(isFirstError: false)
        }
        viewController?.setActionForWiki() { [weak self] urlStr in
            self?.router.presentWiki(urlStr)
        }
    }
    
    func closeTap() {
        router.dismiss()
    }
}

extension RocketInfoPresenter: RocketInfoInteractorOutput {
    
    func rocketInfoDataSuccess(_ data: RocketDatum) {
        viewController?.didReceiveRocketInfoData(data)
        router.removeError()
    }
    
    func rocketInfoDataFailure(_ error: ApiErrors, isFirstError: Bool) {
        if isFirstError {
            router.showError(error)
        } else {
            router.repeatError()
        }
    }
}
