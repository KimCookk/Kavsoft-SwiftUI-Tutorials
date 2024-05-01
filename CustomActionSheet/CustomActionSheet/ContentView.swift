//
//  ContentView.swift
//  CustomActionSheet
//
//  Created by 김태성 on 5/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShow = false
    
    var body: some View {
        ZStack {
            
            Button(action: {
                
                isShow.toggle()
                
            }, label: {
                Text("Action Sheet")
            })
            
            VStack {
                
                Spacer()
                    
                
                CustomActionSheet()
                    .offset(y: self.isShow ? 0 : UIScreen.main.bounds.height)
            }
            .background((self.isShow ? Color.black.opacity(0.25) : Color.clear)
                .onTapGesture {
                    isShow.toggle()
                }
            )
            .edgesIgnoringSafeArea(.all)

        }
    }
}

#Preview {
    ContentView()
}

struct CustomActionSheet: View {
    
    @State var notificationActive: Bool = false
    @State var likeActive: Bool = false
    @State var commentActive: Bool = false
    @State var subscriberCountActive: Bool = false
    @State var count: Int = 0
    
    var body: some View {
        VStack(spacing: 15) {
            Toggle(isOn: self.$notificationActive, label: {
                Text("Notification")
            })
            
            Toggle(isOn: self.$likeActive, label: {
                Text("Likes")
            })
            
            Toggle(isOn: self.$commentActive, label: {
                Text("Comments")
            })
            
            Toggle(isOn: self.$subscriberCountActive, label: {
                Text("Subscribers Counts")
            })
            
            Stepper(onIncrement: {
                self.count += 1
            }, onDecrement: {
                if(self.count != 0) {
                    self.count -= 1
                }
            }, label: {
                Text("Notifications Limit = \(self.count)")
            })
        }
        .padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 10)
        .padding(.horizontal)
        .padding(.top, 20)
        .background(.white)
        .cornerRadius(25)
    }
}
