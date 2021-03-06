//
//  LaunchInteractorInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 13.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchInteractorInput: InteractorInputNetwork {
    func attach(_ output: LaunchInteractorOutput)
    func isFirstStart()
    func fecthNextLaunchId()
}
