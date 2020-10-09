//
//  RocketInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 10.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class RocketInteractor: RocketInteractorInput {
    
    private weak var output: RocketInteractorOutput?
    
    func attach(_ output: RocketInteractorOutput) {
        self.output = output
    }
    
    func fecthData(isFirstError: Bool) {
        let request = RocketRequest()
        NetworkApi.shared.dataTask(request: request) { [weak self] result in
            switch result {
            case.success(let data):
                self?.output?.rocketDataSuccess(data)
            case.failure(let error):
                self?.output?.rocketDataFailure(error, isFirstError: isFirstError)
            }
        }
    }
}
