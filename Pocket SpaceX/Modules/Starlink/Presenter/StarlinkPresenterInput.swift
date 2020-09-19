//
//  StarlinkPresenterInput.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol StarlinkPresenterInput: class {
    func attach(_ viewController: StarlinkPresenterOutput)
    func viewDidLoad()
    func changeDataTap(_ type: Bool)
    func closeTap()
}
