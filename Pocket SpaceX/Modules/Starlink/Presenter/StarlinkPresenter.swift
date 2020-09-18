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
        interactor.fecthData()
        router.needRefresh() { [weak self] () in
            self?.interactor.fecthData()
        }
    }
    
    func closeTap() {
        router.dismiss()
    }
}

extension StarlinkPresenter: StarlinkInteractorOutput {
    func starlinkDataSuccess(_ data: StarlinkData) {
        viewController?.didReceiveStarlinkData(data)
    }
    
    func starlinkDataFailure(_ error: ApiErrors) {
        router.showError(error)
    }
}
