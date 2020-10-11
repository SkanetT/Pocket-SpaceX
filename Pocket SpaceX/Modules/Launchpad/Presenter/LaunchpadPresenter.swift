//
//  LaunchpadPresenter.swift
//  Pocket SpaceX
//
//  Created by Антон on 26.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class LaunchpadPresenter: LaunchpadPresenterInput {
    
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
        viewController?.configureUI()
        interactor.fetchData(isFirstError: true)
        router.needRefresh() { [weak self] () in
            self?.interactor.fetchData(isFirstError: false)
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
        DispatchQueue.main.async {
            self.viewController?.didReceiveLaucnhpadData(sortedData)
        }
        router.removeError()
    }
    
    func launchpadDataFailure(_ error: ApiErrors, isFirstError: Bool) {
        if isFirstError {
            router.showError(error)
        } else {
            router.repeatError()
        }
    }
}
