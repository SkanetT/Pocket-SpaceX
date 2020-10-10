//
//  LaunchInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 13.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class LaunchInteractor: LaunchInteractorInput {
    
    private weak var output: LaunchInteractorOutput?
    private let netService: SpaceXServiceProtocol
    
    init(netService: SpaceXServiceProtocol = SpaceXService() ) {
        self.netService = netService
    }
    
    func attach(_ output: LaunchInteractorOutput) {
        self.output = output
    }
    
    func fetchData(isFirstError: Bool) {
        netService.fetchLaunchs() { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.launchDataSuccess(data)
            case .failure(let error):
                self?.output?.launchDataFailure(error: error, isFirstError: isFirstError)
            }
        }
    }
    
    func isFirstStart() {
        UserDefaultsManager.shared.isFirstStartCheck()
    }
    
    func fecthNextLaunchId() {
        netService.fetchNextLaunch() { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.nextLaunchIdSuccess(data.id)
            case .failure:
                self?.output?.nextLaunchIdFailure()
            }
        }
        
    }
}
