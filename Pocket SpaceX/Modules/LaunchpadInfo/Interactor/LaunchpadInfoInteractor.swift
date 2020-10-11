//
//  LaunchpadInfoInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 28.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

final class LaunchpadInfoInteractor: LaunchpadInfoInteractorInput {
    
    private let id: String
    private let netService: SpaceXServiceProtocol
    private weak var output: LaunchpadInfoInteractorOutput?

    init (id: String, netService: SpaceXServiceProtocol = SpaceXService() ) {
        self.id = id
        self.netService = netService
    }
    
    func attach(_ output: LaunchpadInfoInteractorOutput) {
        self.output = output
    }
    
    func fetchData(isFirstError: Bool) {
      
        netService.fetchLauchpadInfo(id) { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.launchpadInfoDataSuccess(data)
            case .failure(let error):
                self?.output?.launchpadInfoDataFailure(error, isFirstError: isFirstError)
            }
        }
    }
}
