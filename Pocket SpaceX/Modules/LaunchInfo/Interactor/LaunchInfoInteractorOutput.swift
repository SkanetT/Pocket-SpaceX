//
//  LaunchInfoInteractorOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import EventKit


protocol LaunchInfoInteractorOutput: class {
    func launchInfoDataSuccess(_ data: LaunchDatum)
    func rocketNameSuccess(_ name: String)
    func launchpadNameSuccess(_ name: String)
    func rocketIdSuccess(_ id: String)
    func launchpadIdSuccess(_ id: String)
    func newTimeSuccess(_ time: String)
    func addEventSuccess(eventStore: EKEventStore, event: EKEvent)
    func addEventFailure(_ error: Error?)
    func shareDateSuccess(_ links: Links, isShare: Bool)
}
