//
//  StarlinkPresenter.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class StarlinkPresenter: StarlinkPresenterInput {
    
    private weak var viewController: StarlinkPresenterOutput?
    let interactor: StarlinkInteractorInput
    let router: StarlinkRouting

    init(_ interactor: StarlinkInteractorInput, _ router: StarlinkRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    func attach(_ viewController: StarlinkPresenterOutput) {
        self.viewController = viewController
        interactor.attach(self)
    }
    
    func viewDidLoad() {
        interactor.fecthData(isFirstError: true)
        router.needRefresh() { [weak self] () in
            self?.interactor.fecthData(isFirstError: false)
        }
        viewController?.setActionForWiki() { [weak self] () in
            self?.router.presentWiki()
        }
        viewController?.configureUI()
    }
    
    func closeTap() {
        router.dismiss()
    }
    
    func changeDataTap(_ type: Bool) {
        viewController?.setDataChange(type)
    }
}

extension StarlinkPresenter: StarlinkInteractorOutput {
    func starlinkDataSuccess(_ data: StarlinkData) {
        viewController?.didReceiveStarlinkData(data)
        router.removeError()
    }
    
    func starlinkDataFailure(_ error: ApiErrors, isFirstError: Bool) {
        if isFirstError {
            router.showError(error)
        } else {
            router.repeatError()
        }
    }
}
