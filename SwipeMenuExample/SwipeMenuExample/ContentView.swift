//
//  ContentView.swift
//  SwipeMenuExample
//
//  Created by 김태성 on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var size: CGFloat = UIScreen.main.bounds.height - 130
    var body: some View {
        ZStack {
            Color.orange
            
            SwipeMenu()
                .cornerRadius(20)
                .padding(15)
                .offset(y: size)
                .gesture(DragGesture().onChanged({ value in
                    
                    if(value.translation.height > 0 ) {
                        self.size = value.translation.height
                    } else {
                        let temp = UIScreen.main.bounds.height - 130
                        self.size = temp  + value.translation.height
                    }
                    
                    
                }).onEnded({ value in
                    if(value.translation.height > 0 ) {
                        if(value.translation.height > 200) {
                            self.size = UIScreen.main.bounds.height - 130
                        } else {
                            self.size = 15
                        }
                    } else {
                        if(value.translation.height < -200) {
                            self.size = 15
                        } else {
                            self.size = UIScreen.main.bounds.height - 130
                        }
                    }
                }))
                .animation(.spring())
                
        }
    }
}

#Preview {
    ContentView()
}

struct SwipeMenu: View {
    var body: some View {
        VStack {
            VStack {
                Text("Swipe Up to more...")
                    .fontWeight(.heavy)
                    .padding([.top, .bottom], 15)
            }
            
            // Your Custom View
            HStack {
                Spacer()
                Text("Hello Top")
                    .fontWeight(.heavy)
                    .padding()
                Spacer()
            }
            
            
            Spacer()
            
            Text("Hello Bottom")
                .fontWeight(.heavy)
                .padding()
        }
        .background(.white)
    }
}
