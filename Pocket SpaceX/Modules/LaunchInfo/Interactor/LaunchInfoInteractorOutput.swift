//
//  LaunchInfoInteractorOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchInfoInteractorOutput: class {
    func launchInfoDataSuccess(_ data: LaunchDatum)
}
