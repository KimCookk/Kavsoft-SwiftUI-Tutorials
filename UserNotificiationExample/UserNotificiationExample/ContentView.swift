//
//  ContentView.swift
//  UserNotificiationExample
//
//  Created by 김태성 on 4/21/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @State var alert = false
    
    var body: some View {
        
        Button(action: {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { status, _ in
                if status {
                    let content = UNMutableNotificationContent()
                    content.title = "Notification"
                    content.body = "Hello !"
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    
                    let request = UNNotificationRequest(identifier: "noti", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                    
                    return
                }
                
                self.alert.toggle()
            }
        }) {
            Text("send Notification")
        }
        .alert(isPresented: $alert, content: {
            return Alert(title: Text("Please Enable Notification Access In Setting"))
        })
    }
}

#Preview {
    ContentView()
}
