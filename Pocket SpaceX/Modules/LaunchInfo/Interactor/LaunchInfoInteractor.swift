//
//  LaunchInfoInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import EventKit

class LaunchInfoInteractor: LaunchInfoInteractorInput {
    
    private weak var output: LaunchInfoInteractorOutput?
    
    let data: LaunchDatum
    
    init(_ data: LaunchDatum) {
        self.data = data
    }
    
    func attach(_ output: LaunchInfoInteractorOutput) {
        self.output = output
    }
    
    func fecthData() {
        output?.launchInfoDataSuccess(data)
    }
    
    func fetchRocketName() {
        let request = RocketInfoRequest(id: data.rocket)
        NetworkApi.shared.sendRequest(request: request) { [weak self] result in
            switch result {
            case .success(let rocketData):
                self?.output?.rocketNameSuccess(rocketData.name)
            case .failure:
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self?.fetchRocketName()
                }
            }
        }
    }
    
    func fetchLaunchpadName() {
        let request = LaunchpadInfoRequest(id: data.launchpad)
        NetworkApi.shared.sendRequest(request: request) { [weak self] result in
            switch result {
            case .success(let launchtData):
                self?.output?.launchpadNameSuccess(launchtData.name)
            case .failure:
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self?.fetchLaunchpadName()
                }
            }
        }
    }
    
     func fetchRocketId() {
        output?.rocketIdSuccess(data.rocket)
    }
    
    func fetchLaunchpadId() {
        output?.launchpadIdSuccess(data.launchpad)
    }
    
    func fetchNewTime() {
        let time = DataManager.makeDateForTimer(data.dateUnix)
        output?.newTimeSuccess(time)
    }
    
    func fetchDataForShare(isShare: Bool) {
        output?.shareDateSuccess(data.links, isShare: isShare)
    }
    
    func attemptAddEvent() {
        let eventStore = EKEventStore()
        eventStore.requestAccess(to: .event) { [weak self] granted, error in
            guard let self = self else { return }
            if granted && error == nil {
                let event = EKEvent(eventStore: eventStore)
                event.title = self.data.name
                event.startDate = Date(timeIntervalSince1970: Double(self.data.dateUnix))
                event.endDate = Date(timeIntervalSince1970: Double(self.data.dateUnix + 3600))
                let alarm = EKAlarm(relativeOffset: -3600)
                event.alarms = [alarm]
                event.notes = self.data.details
                if let urlWiki = self.data.links.wikipedia {
                    event.url = URL(string: urlWiki)
                }
                self.output?.addEventSuccess(eventStore: eventStore, event: event)
            } else {
                self.output?.addEventFailure(error)
            }
        }
    }
}
