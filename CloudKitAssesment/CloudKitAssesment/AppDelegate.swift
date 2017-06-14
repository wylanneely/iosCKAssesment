//
//  AppDelegate.swift
//  CloudKitAssesment
//
//  Created by ALIA M NEELY on 6/14/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { (isAuthorized, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if isAuthorized {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            ContactController.subscribeToContactCreations()
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
            ContactController.fetchContacts()
    }



}

