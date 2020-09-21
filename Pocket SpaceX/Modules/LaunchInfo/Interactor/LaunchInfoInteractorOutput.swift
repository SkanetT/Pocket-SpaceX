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
    func addEventSuccess(eventStore: EKEventStore, event: EKEvent)
    func addEventFailure(_ error: Error?)
}
