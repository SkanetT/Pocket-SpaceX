//
//  LaunchInfoAssembler.swift
//  Pocket SpaceX
//
//  Created by Антон on 15.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class LaunchInfoAssembler {
    
    static func createModule(data: LaunchDatum) -> UIViewController {
        let viewController = LaunchInfoController()
        
        return viewController
    }
}
