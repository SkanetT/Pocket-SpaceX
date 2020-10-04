//
//  SettingsInteractor.swift
//  Pocket SpaceX
//
//  Created by Антон on 02.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation
import Kingfisher

class SettingsInteractor: SettingsInteractorInput {
    
    private weak var output: SettingsInteractorOutput?
    
    func attach(_ output: SettingsInteractorOutput) {
        self.output = output
    }
    
    func fetchVideoStatus() {
        output?.videoStatusSuccess(UserDefaultsManager.shared.fetchVideoStatus())
    }
    
    func changeVideoStatus(_ status: Bool) {
        UserDefaultsManager.shared.changeVideoStatus(status)
    }
    
    func fetchInfoText() {
        output?.infoTextSuccess(version: DataManager.getVersion(), build: DataManager.getBuild())
    }
    
    func deleteKFCache() {
        let cache = ImageCache.default
        cache.clearMemoryCache()
        cache.clearDiskCache(completion: nil)
        output?.deleteCacheSuccess()
    }

}
