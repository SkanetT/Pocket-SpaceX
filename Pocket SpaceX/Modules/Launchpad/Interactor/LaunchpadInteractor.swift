//
//  LaunchpadInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 27.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class LaunchpadInteractor: LaunchpadInteractorInput {
    
    private weak var output: LaunchpadInteractorOutput?
    private let netService: SpaceXServiceProtocol
    
    init(netService: SpaceXServiceProtocol = SpaceXService() ) {
        self.netService = netService
    }
    
    func attach(_ output: LaunchpadInteractorOutput) {
        self.output = output
    }
    
    func fetchData(isFirstError: Bool) {
      
        netService.fetchLauchpads() { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.launchpadDataSuccess(data)
            case .failure(let error):
                self?.output?.launchpadDataFailure(error, isFirstError: isFirstError)
            }
        }
    }
}
