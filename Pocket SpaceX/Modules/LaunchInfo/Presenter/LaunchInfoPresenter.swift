//
//  LaunchInfoPresenter.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import EventKit

class LaunchInfoPresenter: LaunchInfoPresenterInput {
    
    private weak var viewController: LaunchInfoPresenterOutput?
    let interactor: LaunchInfoInteractorInput
    let router: LaunchInfoRouting
    
    init(_ interactor: LaunchInfoInteractorInput, _ router: LaunchInfoRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    func attach(_ viewController: LaunchInfoPresenterOutput) {
        self.viewController = viewController
        interactor.attach(self)
    }
    
    func viewDidLoad() {
        interactor.fecthData()
        interactor.fetchRocketName()
    }
    
    func addEventTap() {
        interactor.attemptAddEvent()
    }
    
}

extension LaunchInfoPresenter: LaunchInfoInteractorOutput {
    
    func launchInfoDataSuccess(_ data: LaunchDatum) {
        viewController?.didReceiveLaunchInfoData(data)
    }
    
    func addEventSuccess(eventStore: EKEventStore, event: EKEvent) {
        router.showEventEditView(eventStore: eventStore, event: event)
    }
    
    func addEventFailure(_ error: Error?) {
        router.showAddEventError(error)
    }
}
