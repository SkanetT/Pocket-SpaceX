//
//  LaunchpadPresenterOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 26.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchpadPresenterOutput: class {
    func configureUI()
    func didReceiveLaucnhpadData(_ data: LaunchpadData)
    func setActionForCell(_ userSelect: ((String) -> ())?)
}
