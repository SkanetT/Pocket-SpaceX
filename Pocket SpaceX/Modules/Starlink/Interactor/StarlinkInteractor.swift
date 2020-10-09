//
//  StarlinkInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 16.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class StarlinkInteractor: StarlinkInteractorInput {
    
    private weak var output: StarlinkInteractorOutput?
    
    func attach(_ output: StarlinkInteractorOutput) {
        self.output = output
    }
    
    func fecthData(isFirstError: Bool) {
        let request = StarlinkRequest()
        NetworkApi.shared.dataTask(request: request) { [weak self] result in
            switch result {
            case .success(let data):
                self?.output?.starlinkDataSuccess(data)
            case .failure(let error):
                self?.output?.starlinkDataFailure(error, isFirstError: isFirstError)
            }
        }
    }
}
