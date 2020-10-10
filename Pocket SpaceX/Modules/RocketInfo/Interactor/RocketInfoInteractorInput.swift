//
//  RocketInfoInteractorInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol RocketInfoInteractorInput: InteractorInputNetwork {
    func attach(_ output: RocketInfoInteractorOutput)
}
