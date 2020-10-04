//
//  SettingsPresenter.swift
//  Pocket SpaceX
//
//  Created by Антон on 02.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class SettingsPresenter: SettingsPresenterInput {
    
    private weak var viewController: SettingsPresenterOutput?
    let interactor: SettingsInteractorInput
    let router: SettingsRouting
    
    init(_ interactor: SettingsInteractorInput, _ router: SettingsRouting) {
        self.interactor = interactor
        self.router = router
    }
    
    func attach(_ viewController: SettingsPresenterOutput) {
        self.viewController =  viewController
        interactor.attach(self)
    }
    
    func viewDidLoad() {
        interactor.fetchVideoStatus()
        interactor.fetchInfoText()
    }
    
    func dismissRequest() {
        router.dismiss()
    }
    
    func videoSettingsChange(_ status: Bool) {
        interactor.changeVideoStatus(status)
    }
    
    func clearTap() {
        interactor.deleteKFCache()
    }
    
}

extension SettingsPresenter: SettingsInteractorOutput {
    func videoStatusSuccess(_ status: Bool) {
        viewController?.didReceiveVideoStatus(status)
    }
    
    func infoTextSuccess(version: String, build: String) {
        viewController?.didReceiveInfoText(version: version, build: build)
    }
    
    func deleteCacheSuccess() {
        viewController?.didDeleteCache()
    }
    
}
