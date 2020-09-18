//
//  StarlinkPresenterOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol StarlinkPresenterOutput: class {
    func didReceiveStarlinkData(_ data: StarlinkData)
}
