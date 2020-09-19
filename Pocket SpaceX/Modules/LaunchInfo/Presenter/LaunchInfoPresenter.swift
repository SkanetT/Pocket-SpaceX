//
//  LaunchInfoPresenter.swift
//  Pocket SpaceX
//
//  Created by Антон on 19.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class LaunchInfoPresenter: LaunchInfoPresenterInput {
    
    private weak var viewController: LaunchInfoPresenterOutput?
    let interactor: LaunchInfoInteractorInput
    
    init(_ interactor: LaunchInfoInteractorInput) {
        self.interactor = interactor
    }
    
    func attach(_ viewController: LaunchInfoPresenterOutput) {
        self.viewController = viewController
        interactor.attach(self)
    }
    
    func viewDidLoad() {
        interactor.fecthData()
    }
    
}

extension LaunchInfoPresenter: LaunchInfoInteractorOutput {
    func launchInfoDataSuccess(_ data: LaunchDatum) {
        viewController?.didReceiveLaunchInfoData(data)
    }
    
}
