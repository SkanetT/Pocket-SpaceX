//
//  LaunchInfoInteractorInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchInfoInteractorInput: InteractorInput {
    func attach(_ output: LaunchInfoInteractorOutput)
    func fecthData()
    func fetchRocketName()
    func fetchLaunchpadName()
    func fetchDataForShare(isShare: Bool)
    func fetchRocketId()
    func fetchLaunchpadId()
    func attemptAddEvent()
    func fetchNewTime()
}
