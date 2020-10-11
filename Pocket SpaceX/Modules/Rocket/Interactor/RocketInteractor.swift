//
//  RocketInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 10.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class RocketInteractor: RocketInteractorInput {
    
    private weak var output: RocketInteractorOutput?
    
    private let netService: SpaceXServiceProtocol
    
    init(netService: SpaceXServiceProtocol = SpaceXService() ) {
        self.netService = netService
    }
    
    func attach(_ output: RocketInteractorOutput) {
        self.output = output
    }
    
    func fetchData(isFirstError: Bool) {
       
        netService.fetchRockets() { [weak self] result in
            switch result {
            case.success(let data):
                self?.output?.rocketDataSuccess(data)
            case.failure(let error):
                self?.output?.rocketDataFailure(error, isFirstError: isFirstError)
            }
        }
    }
}
