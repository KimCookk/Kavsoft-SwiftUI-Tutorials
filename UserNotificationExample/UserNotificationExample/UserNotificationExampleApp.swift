//
//  UserNotificationExampleApp.swift
//  UserNotificationExample
//
//  Created by 김태성 on 4/29/24.
//

import SwiftUI
import UserNotifications

@main
struct UserNotificationExampleApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate{
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    // 초기화 부분 (앱이 실행되고 처음 실행되는 메서드)
         UNUserNotificationCenter.current().delegate = self
         return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.actionIdentifier == "open" {
            NotificationCenter.default.post(name: NSNotification.Name("Detail"), object: nil)
        }
    }
    
}
