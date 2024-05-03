//
//  ContentView.swift
//  ActivityIndicatorExample
//
//  Created by 김태성 on 5/3/24.
//

import SwiftUI

struct ContentView: View {

    @State var show = false

    var body: some View {
        
        ZStack {
            Button(action: {
                
                show.toggle()
                
            }) {
                Text("Custom Indicator")
            }
            
            if show {
                GeometryReader { geo in
                    LoadingIndicator()
                        .position(x: geo.frame(in: .local).midX,
                                  y: geo.frame(in: .local).midY)
                        
                }
                .background(Color.black.opacity(0.45)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                    self.show.toggle()
                })
            }
        }
    }
}

#Preview {
    ContentView()
}

struct LoadingIndicator: View {
    
    @State var animaite = false
    
    var body: some View {
        
        VStack {
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient:.init(colors: [.red, .orange]), center: .center), style:StrokeStyle(lineWidth: 8, lineCap: .round))
                .frame(width: 45, height: 45)
                .rotationEffect(.init(degrees: self.animaite ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false))
            
            Text("Please Wait....")
                .padding(.top)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .onAppear {
            self.animaite.toggle()
        }
        
    }
}
