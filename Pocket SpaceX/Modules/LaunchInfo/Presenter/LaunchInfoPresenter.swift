//
//  LaunchInfoPresenter.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import EventKit

final class LaunchInfoPresenter: LaunchInfoPresenterInput {
    
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
        viewController?.configureUI()
        interactor.fecthData()
        interactor.fetchRocketName()
        interactor.fetchLaunchpadName()
    }
    
    func addEventTap() {
        interactor.attemptAddEvent()
    }
    
    func timerTick() {
        interactor.fetchNewTime()
    }
    
    func rocketTap() {
        interactor.fetchRocketId()
    }
    
    func launchpadTap() {
        interactor.fetchLaunchpadId()
    }
    
    func shareTap() {
        interactor.fetchDataForShare(isShare: true)
    }
    func linksTap() {
        interactor.fetchDataForShare(isShare: false)
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
    
    func newTimeSuccess(_ time: String) {
        viewController?.didReceiveNewTime(time)
    }
    
    func rocketNameSuccess(_ name: String) {
        viewController?.didReceiveRocketName(name)
    }
    
    func rocketIdSuccess(_ id: String) {
        router.rocketInfoPresent(id)
    }
    
    func launchpadIdSuccess(_ id: String) {
        router.launchpadInfoPresent(id)
    }
    
    func launchpadNameSuccess(_ name: String) {
        viewController?.didReceiveLaunchpadName(name)
    }
    
    func shareDateSuccess(_ links: Links, isShare: Bool) {
        router.sharePresent(links, isShare: isShare)
    }
}
