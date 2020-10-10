//
//  Protocols.swift
//  Pocket SpaceX
//
//  Created by Антон on 10.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//



protocol InteractorInput: class {
    
}

protocol InteractorInputNetwork: InteractorInput {
    func fetchData(isFirstError: Bool)
}

protocol InteractorOutput: class {
    
}

protocol PresenterInput: class  {
    func viewDidLoad()
}

protocol PresenterOutput: class {
    func configureUI()
}

protocol RoutingError {
    func needRefresh(refresh: (() -> ())?)
    func showError(_ error: ApiErrors)
    func repeatError()
    func removeError()
}
