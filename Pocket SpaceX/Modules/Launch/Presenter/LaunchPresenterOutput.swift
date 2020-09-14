//
//  LaunchPresenterOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchPresenterOutput: class {
    
    func didReceiveLaunchData(_ data: LaunchData)
    func needToReverse()
    func setActionForCell(_ userSelect: ((LaunchDatum) -> ())?)
}
