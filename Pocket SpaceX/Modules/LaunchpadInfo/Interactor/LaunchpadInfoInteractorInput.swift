//
//  LaunchpadInfoInteractorInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 28.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol LaunchpadInfoInteractorInput: InteractorInputNetwork {
    func attach(_ output: LaunchpadInfoInteractorOutput)
}
