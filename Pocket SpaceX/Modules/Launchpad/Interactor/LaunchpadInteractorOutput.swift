//
//  LaunchpadInteractorOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 27.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol  LaunchpadInteractorOutput: InteractorOutput {
    func launchpadDataSuccess(_ data: LaunchpadData)
    func launchpadDataFailure(_ error: ApiErrors, isFirstError: Bool)
}
