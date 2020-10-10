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
    let interactor: LaunchInteractorInput
    let router: LaunchRouting
    
    init(_ interactor: LaunchInteractorInput, _ router: LaunchRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    func attach(_ viewController: LaunchPresenterOutput) {
        self.viewController = viewController
        interactor.attach(self)
    }
    
    func viewDidLoad() {
        viewController?.configureUI()
        viewController?.configureSegmentedContoll()
        viewController?.configureNextButton()
        interactor.fetchData(isFirstError: true)
        interactor.isFirstStart()
        viewController?.setActionForCell() {[weak self] data in
            self?.router.presentLaunchInfo(data)
        }
        router.needRefresh() { [weak self] () in
            self?.interactor.fetchData(isFirstError: false)
        }
    }
    
    func sideMenuTap() {
        router.showSideMenu()
    }
    
    func reverseTap() {
        viewController?.needToReverse()
    }
    
    func launchTypeChange(_ type: LaunchType) {
        viewController?.typeChange(type)
    }
    
    func refreshData() {
        interactor.fetchData(isFirstError: true)
    }
    
    func nextLaunchTap() {
        interactor.fecthNextLaunchId()
    }
    
}

extension LaunchPresenter: LaunchInteractorOutput {
    func launchDataSuccess(_ data: LaunchData) {
        let sortedData = data.sorted(by: { $0.dateUnix < $1.dateUnix })
        viewController?.didReceiveLaunchData(sortedData)
        router.removeError()
    }
    
    func launchDataFailure(error: ApiErrors, isFirstError: Bool) {
        if isFirstError {
            router.showError(error)
        } else {
            router.repeatError()
        }
    }
    
    func nextLaunchIdSuccess(_ id: String) {
        viewController?.didReceiveNextLaunchId(id)
    }
    
    func nextLaunchIdFailure() {
        viewController?.didReceiveNextLaunchError()
    }
}
