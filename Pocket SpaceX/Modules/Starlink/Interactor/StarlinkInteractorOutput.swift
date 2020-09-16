//
//  StarlinkInteractorOutput.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

protocol StarlinkInteractorOutput: class {
    func starlinkDataSuccess(_ data: StarlinkData)
    func starlinkDataFailure(_ error: ApiErrors)
}
