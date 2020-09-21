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
        NetworkApi.shared.dataTask(request: request) { result in
            switch result {
            case .success(let rocketData):
                print(rocketData.name)
            case .failure(let error):
                print(error)
            }
            
        }
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
                let al = EKAlarm(relativeOffset: -3600)
                event.alarms = [al]
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
