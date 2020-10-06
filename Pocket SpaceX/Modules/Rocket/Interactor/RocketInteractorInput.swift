//
//  RocketInteractorInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 10.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol RocketInteractorInput: class {
    
    func attach(_ output: RocketInteractorOutput)
    func fecthData()
    func repeatFecthData()
}
