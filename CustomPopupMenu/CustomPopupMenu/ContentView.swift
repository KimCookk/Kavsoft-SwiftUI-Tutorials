//
//  ContentView.swift
//  CustomPopupMenu
//
//  Created by 김태성 on 4/28/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    
    var body: some View {
        
        ZStack {
            NavigationView {
                Text("Add Someting")
                    .navigationTitle("Home")
                    .navigationBarItems(
                        leading:
                            
                            Image("bg")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .clipShape(Circle()),
                        
                        trailing:
                            
                            Button(action: {
                                withAnimation {
                                    self.show.toggle()
                                }
                            }, label: {
                                
                                Image("menu")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 30, height:30)
                            })
                    )
            }
            
            if(show) {
                GeometryReader { geo in
                    MenuPopup()
                        .position(x:geo.frame(in:.global).midX,
                                  y:geo.frame(in:.global).midY)
                }.background(
                        Color.black
                        .opacity(0.65)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                self.show.toggle()
                            }
                        }
                )
            }
        }
        
       // MenuPopup()

    
    }
}

#Preview {
    ContentView()
}

struct MenuPopup: View {
    var body: some View {
        VStack(alignment: .leading,
               spacing: 15,
               content: {
            
            Button(action: {
                
            }) {
                HStack(spacing: 12) {
                    Image("Home")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 38, height: 35)
                        .offset(x: -2)
                    
                    Text("Home")
                        .foregroundColor(.black)
                }
            }
            
            Button(action: {
                
            }) {
                HStack(spacing: 12) {
                    Image("Profile")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 38, height: 35)
                        .offset(x: -2)
                    
                    Text("Profile")
                        .foregroundColor(.black)
                }
            }
            
            Button(action: {
                
            }) {
                HStack(spacing: 12) {
                    Image("Notification")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 38, height: 35)
                        .offset(x: -2)
                    
                    Text("Notification")
                        .foregroundColor(.black)
                }
            }
            
            Button(action: {
                
            }) {
                HStack(spacing: 12) {
                    Image("Settings")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 38, height: 35)
                        .offset(x: -2)
                    
                    Text("Settings")
                        .foregroundColor(.black)
                }
            }
            
        })
        .padding()
        .background(.white)
        .cornerRadius(15)
    }
}
