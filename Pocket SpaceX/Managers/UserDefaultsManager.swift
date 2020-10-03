//
//  UserDefaultsManager.swift
//  Pocket SpaceX
//
//  Created by Антон on 02.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    let defaults = UserDefaults.standard
    
    func isFirstStartCheck() {
        if defaults.string(forKey: "first") == nil {
            defaults.set("1", forKey: "first")
            defaults.set(false, forKey: "video")
        }
    }
    
    func fetchVideoStatus() -> Bool {
        let status = defaults.bool(forKey: "video") 
        return status
    }
    
    func changeVideoStatus(_ status: Bool) {
        defaults.set(status, forKey: "video")
    }
    
}
