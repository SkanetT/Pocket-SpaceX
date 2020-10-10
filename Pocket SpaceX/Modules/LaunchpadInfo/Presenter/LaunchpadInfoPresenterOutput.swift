//
//  LaunchpadInfoPresenterOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 28.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchpadInfoPresenterOutput: PresenterOutput {
    func didReceiveLaunchpadInfoData(_ data: LaunchpadDatum)
}
