//
//  NotificationManager.swift
//  Pocket SpaceX
//
//  Created by Антон on 22.10.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    static let shared = NotificationManager()
    let gcmMessageIDKey = "gcm.message_id"
    
    func makeRequestAuthorization() {
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { (_, error) in
            guard error == nil else { return }
        }
    }
    
}
