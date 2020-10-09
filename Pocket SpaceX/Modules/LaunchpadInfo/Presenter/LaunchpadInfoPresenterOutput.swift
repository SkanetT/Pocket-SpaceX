//
//  LaunchpadInfoPresenterOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 28.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchpadInfoPresenterOutput: class {
    func configureUI()
    func didReceiveLaunchpadInfoData(_ data: LaunchpadDatum)
}
