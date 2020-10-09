//
//  LaunchpadInfoInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 28.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class LaunchpadInfoInteractor: LaunchpadInfoInteractorInput {
    
    let id: String
    private weak var output: LaunchpadInfoInteractorOutput?

    init (id: String) {
        self.id = id
    }
    
    func attach(_ output: LaunchpadInfoInteractorOutput) {
        self.output = output
    }
    
    func fecthData(isFirstError: Bool) {
        let request = LaunchpadInfoRequest(id: id)
        NetworkApi.shared.dataTask(request: request) { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.launchpadInfoDataSuccess(data)
            case .failure(let error):
                self?.output?.launchpadInfoDataFailure(error, isFirstError: isFirstError)
            }
        }
    }
}
