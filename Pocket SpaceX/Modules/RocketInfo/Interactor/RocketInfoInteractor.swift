//
//  RocketInfoInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 11.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class RocketInfoInteractor: RocketInfoInteractorInput {
    
    let id: String
    private weak var output: RocketInfoInteractorOutput?
    
    init (id: String) {
        self.id = id
    }
    
    func attach(_ output: RocketInfoInteractorOutput) {
        self.output = output
    }
    
    func fecthData() {
        let request = RocketInfoRequest(id: id)
        NetworkApi.shared.dataTask(request: request) { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.rocketInfoDataSuccess(data)
            case .failure(let error):
                self?.output?.rocketInfoDataFailure(error)
            }
        }
    }
}
