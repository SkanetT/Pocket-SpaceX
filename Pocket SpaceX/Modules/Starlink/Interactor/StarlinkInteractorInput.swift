//
//  StarlinkInteractorInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol StarlinkInteractorInput: InteractorInputNetwork {
    func attach(_ output: StarlinkInteractorOutput)
}
