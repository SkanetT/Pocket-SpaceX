//
//  LaunchpadInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 27.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class LaunchpadInteractor: LaunchpadInteractorInput {
    
    private weak var output: LaunchpadInteractorOutput?
    
    
    func attach(_ output: LaunchpadInteractorOutput) {
        self.output = output
    }
    
    func fecthData() {
        let request = LaunchpadRequest()
        NetworkApi.shared.dataTask(request: request) { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.launchpadDataSuccess(data)
            case .failure(let error):
                self?.output?.launchpadDataFailure(error)
            }
        }
    }
    
}
