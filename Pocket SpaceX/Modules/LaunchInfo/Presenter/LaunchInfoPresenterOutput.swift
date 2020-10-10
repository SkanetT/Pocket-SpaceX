//
//  LaunchInfoPresenterOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchInfoPresenterOutput: PresenterOutput {
    func didReceiveLaunchInfoData(_ data: LaunchDatum)
    func didReceiveRocketName(_ name: String)
    func didReceiveLaunchpadName(_ name: String)
    func didReceiveNewTime(_ time: String )
}
