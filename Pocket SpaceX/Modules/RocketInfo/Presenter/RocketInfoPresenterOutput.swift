//
//  RocketInfoPresenterOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol RocketInfoPresenterOutput: PresenterOutput {
    func didReceiveRocketInfoData(_ data: RocketDatum)
    func setActionForWiki(_ userSelectWiki: ((String) -> ())?)
}
