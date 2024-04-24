//
//  ContentView.swift
//  CustomAlertView
//
//  Created by 김태성 on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var shown = false
    var body: some View {
        ZStack {
         
            // main page design ...
            NavigationView {
                List(0 ..< 10) { index in
                    Text("\(index + 1). Hello")
                }
                .navigationTitle("Home")
                .navigationBarItems(trailing: Button(action: {
                    self.shown.toggle()
                }, label: {
                    
                    Text("Open")
                }))
            }
            .blur(radius: shown ? 10 : 0)

            
            // custom alert view here...
            if shown {
                AlertView(shown: $shown)
            }
        }
        .animation(.spring)
    }
}

#Preview {
    ContentView()
}

struct AlertView: View {
    
    @Binding var shown: Bool
    
    var body: some View {
        ZStack {
            ZStack {
                Spacer()
                // Custom View here
            }
            .background(Color.green)
            .frame(width: 200, height: 300)
            .cornerRadius(20)
            .padding(20)
            
            Button(action: {
                
                self.shown.toggle()
                
            }, label: {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .padding(8)
            })
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .offset(x: 90.0, y: -140.0)
        }
    }
}
