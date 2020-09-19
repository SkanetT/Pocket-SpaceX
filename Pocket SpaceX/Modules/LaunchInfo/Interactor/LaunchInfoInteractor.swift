//
//  LaunchInfoInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class LaunchInfoInteractor: LaunchInfoInteractorInput {
    
    private weak var output: LaunchInfoInteractorOutput?
    
    let data: LaunchDatum
    
    init(_ data: LaunchDatum) {
        self.data = data
    }
    
    func attach(_ output: LaunchInfoInteractorOutput) {
        self.output = output
    }
    
    func fecthData() {
        output?.launchInfoDataSuccess(data)
    }
    
}
