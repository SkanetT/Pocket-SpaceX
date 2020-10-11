//
//  StarlinkInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class StarlinkInteractor: StarlinkInteractorInput {
    
    private weak var output: StarlinkInteractorOutput?
    
    private let netService: SpaceXServiceProtocol
    
    init(netService: SpaceXServiceProtocol = SpaceXService() ) {
        self.netService = netService
    }
    
    func attach(_ output: StarlinkInteractorOutput) {
        self.output = output
    }
    
    func fetchData(isFirstError: Bool) {
        netService.fetchStarlink() { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.starlinkDataSuccess(data)
            case .failure(let error):
                self?.output?.starlinkDataFailure(error, isFirstError: isFirstError)
            }
        }
    }
}
