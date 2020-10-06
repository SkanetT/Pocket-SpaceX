//
//  LaunchpadInteractorInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 27.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchpadInteractorInput: class {
    func attach(_ output: LaunchpadInteractorOutput)
    func fecthData()
    func repeatFecthData()
}
