//
//  RocketPresenterOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 08.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol RocketPresenterOutput: PresenterOutput {
    func didReceiveRocketData(_ data: RocketData)
    func setActionForCell(_ userSelect: ((String) -> ())?)
}
