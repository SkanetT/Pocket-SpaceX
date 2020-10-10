//
//  RocketInteractorInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 10.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol RocketInteractorInput: InteractorInputNetwork {
    func attach(_ output: RocketInteractorOutput)
}
