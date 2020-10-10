//
//  LaunchpadInfoInteractorOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 28.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchpadInfoInteractorOutput: InteractorOutput {
    func launchpadInfoDataSuccess(_ data: LaunchpadDatum)
    func launchpadInfoDataFailure(_ error: ApiErrors, isFirstError: Bool)
}
