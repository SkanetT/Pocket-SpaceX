//
//  RocketInfoInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class RocketInfoInteractor: RocketInfoInteractorInput {
    
    private let id: String
    private let netService: SpaceXServiceProtocol
    private weak var output: RocketInfoInteractorOutput?
    
    init (id: String, netService: SpaceXServiceProtocol = SpaceXService() ) {
        self.id = id
        self.netService = netService
    }
    
    func attach(_ output: RocketInfoInteractorOutput) {
        self.output = output
    }
    
    func fetchData(isFirstError: Bool) {
        netService.fetchRocketInfo(id) { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.rocketInfoDataSuccess(data)
            case .failure(let error):
                self?.output?.rocketInfoDataFailure(error, isFirstError: isFirstError)
            }
        }
    }
}
