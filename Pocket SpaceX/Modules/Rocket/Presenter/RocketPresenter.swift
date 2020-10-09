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
    let interactor: RocketInteractorInput
    let router: RocketRouting
    
    init(_ interactor: RocketInteractorInput, _ router: RocketRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    func attach(_ viewController: RocketPresenterOutput) {
        self.viewController = viewController
        interactor.attach(self)
    }
    
    func viewDidLoad() {
        interactor.fecthData(isFirstError: true)
        viewController?.setActionForCell() {[weak self] id in
            self?.router.rocketInfoPresent(id: id)
        }
        router.needRefresh() { [weak self] () in
            self?.interactor.fecthData(isFirstError: false)
        }
        viewController?.configureUI()
    }
    
    func closeTap() {
        router.dismiss()
    }
}

extension RocketPresenter: RocketInteractorOutput {
    
    func rocketDataSuccess(_ data: RocketData) {
        viewController?.didReceiveRocketData(data)
        router.removeError()
    }
    
    func rocketDataFailure(_ error: ApiErrors, isFirstError: Bool) {
        if isFirstError {
            router.showError(error)
        } else {
            router.repeatError()
        } 
    }
}

