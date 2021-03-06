//
//  LaunchPresenterOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchPresenterOutput: PresenterOutput {
    func configureSegmentedContol()
    func configureNextButton()
    func didReceiveLaunchData(_ data: LaunchData)
    func nextLaunchSearchStart()
    func didReceiveNextLaunchId(_ id: String)
    func didReceiveNextLaunchError()
    func needToReverse()
    func typeChange(_ type: LaunchType)
    func setActionForCell(_ userSelect: ((LaunchDatum) -> ())?)
}
