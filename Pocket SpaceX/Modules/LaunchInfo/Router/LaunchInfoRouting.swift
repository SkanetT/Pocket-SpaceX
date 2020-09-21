//
//  LaunchInfoRouting.swift
//  Pocket SpaceX
//
//  Created by Антон on 21.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import EventKit

protocol LaunchInfoRouting {
    func showEventEditView(eventStore: EKEventStore, event: EKEvent)
    func showAddEventError(_ error: Error?)
}