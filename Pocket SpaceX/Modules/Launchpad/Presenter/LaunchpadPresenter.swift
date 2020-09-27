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
    let interactor: LaunchpadInteractorInput
    let router: LaunchpadRouting
    
    init(_ interactor: LaunchpadInteractorInput, _ router: LaunchpadRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    func attach(_ viewController: LaunchpadPresenterOutput) {
        self.viewController = viewController
        interactor.attach(self)
    }
    
    func viewDidLoad() {
        interactor.fecthData()
        router.needRefresh() { [weak self] () in
            self?.interactor.fecthData()
        }
        viewController?.setActionForCell() {[weak self] id in
            self?.router.launchpadInfoPresent(id: id)
        }
    }
    
    func closeTap() {
        router.dismiss()
    }
    
}

extension LaunchpadPresenter: LaunchpadInteractorOutput {
    func launchpadDataSuccess(_ data: LaunchpadData) {
        let sortedData = data.sorted(by: { $0.status < $1.status })
        viewController?.didReceiveLaucnhpadData(sortedData)
    }
    
    func launchpadDataFailure(_ error: ApiErrors) {
        router.showError(error)
    }
        
}
