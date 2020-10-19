//
//  AppDelegate.swift
//  Pocket SpaceX
//
//  Created by Антон on 06.09.2020.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import SnapKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = ContainerController()
        FirebaseApp.configure()
                UNUserNotificationCenter.current().delegate = self
        
                let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        
                UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { (_, error) in
                    guard error == nil else{
                        print(error!.localizedDescription)
                        return
                    }
                }
        
                application.registerForRemoteNotifications()
        Messaging.messaging().delegate = self
        
        UNUserNotificationCenter.current().delegate = self
     //   let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        //Solicit permission from the user to receive notifications
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { (_, error) in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
        }
        
        //get application instance ID
        
        InstanceID.instanceID().instanceID { (result, error) in
            if let error = error {
                print("Error fetching remote instance ID: \(error)")
            } else if let result = result {
                print("Remote instance ID token: \(result.token)")
            }
        }
        
        application.registerForRemoteNotifications()
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
            if let messageID = userInfo[gcmMessageIDKey] {
                print("Message ID: \(messageID)")
            }
             
            // Print full message.
            print(userInfo)
        }
     
        func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
            print("Unable to register for remote notifications: \(error.localizedDescription)")
        }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
            print("Firebase registration token: \(fcmToken)")
             
            let dataDict:[String: String] = ["token": fcmToken]
            NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
            // TODO: If necessary send token to application server.
            // Note: This callback is fired at each app startup and whenever a new token is generated.
        }
         
        func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
            print("Received data message: \(remoteMessage.appData)")
        }
    
}

