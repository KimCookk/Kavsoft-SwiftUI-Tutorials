//
//  ContentView.swift
//  UserNotificationExample
//
//  Created by 김태성 on 4/29/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @State var show = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                NavigationLink(destination: DetailView(show: self.$show), isActive: self.$show) {
                    
                    Text("")
                }
                
                Button(action: {
                    
                    send()
                    
                }, label: {
                    Text("Send Notification")
                })
                .navigationTitle("Home")
                
            }.onAppear {
                NotificationCenter.default.addObserver(forName: NSNotification.Name("Detail"), object: nil, queue: .main) { Notification in
                    
                    self.show = true
                }
            }
        }
    }
    
    func send() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { (_, _) in
            
        })
        
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "New Tutorial From Swift !!!"
        
        let open = UNNotificationAction(identifier: "open", title: "Open", options: .foreground)
        
        let cancel = UNNotificationAction(identifier: "cancle", title: "Cancle", options: .destructive)
        
        let categories = UNNotificationCategory(identifier: "action", actions: [open, cancel], intentIdentifiers: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([categories])
        
        content.categoryIdentifier = "action"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,
                                                        repeats: false)
        let reqeust = UNNotificationRequest(identifier: "request",
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(reqeust, withCompletionHandler: nil)
    }
}

#Preview {
    ContentView()
}

struct DetailView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        Text("Detail")
            .navigationBarTitle("Detail View")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                    Button(action: {
                    self.show = false
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.title)
                })
            )
    }
}
