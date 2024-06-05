//
//  ContentView.swift
//  HamburgerMenu
//
//  Created by 김태성 on 6/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HomeView()
    }
}

#Preview {
    ContentView()
}

struct HomeView: View {
    
    @State var isDarkMode = false
    @State var isShow = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            
            GeometryReader{ geo in
                VStack {
                    
                    ZStack {
                        HStack {
                            Button(action: {
                                
                                withAnimation(.default) {
                                    self.isShow.toggle()
                                }
                                
                            }) {
                                Image(systemName: "list.bullet")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            
                            Spacer()
                        }
                        
                        Text("Home")
                    }
                    .padding()
                    .foregroundColor(.primary)
                    .overlay(Rectangle().stroke(Color.primary.opacity(0.1), lineWidth: 1).shadow(radius: 3).edgesIgnoringSafeArea(.top))
                    
                    Spacer()

                    Text("Dark Mode Menu")
                    
                    Spacer()
                }
            }
            
            
            HStack {
                MenuView(isDarkMode: self.$isDarkMode,
                         isShow: self.$isShow)
                .preferredColorScheme(self.isDarkMode ? .dark : .light)
                .offset(x: self.isShow ? 0 : -UIScreen.main
                    .bounds.width / 0.5)
                
                Spacer(minLength: 0)
            }
            .background(Color.primary.opacity(self.isShow ? (self.isDarkMode ? 0.05 : 0.2) : 0).edgesIgnoringSafeArea(.all))
        }
    }
}

struct MenuView: View {
    
    @Binding var isDarkMode: Bool
    @Binding var isShow: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    
                    withAnimation(.default) {
                        self.isShow.toggle()
                    }
                    
                }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 12, height: 20)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                }
            }
            .padding(.top)
            .padding(.bottom, 25)
            
            Image(systemName: "")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            VStack(spacing: 12) {
                Text("Cook")
                
                Text("Developer")
                    .font(.caption)
            }
            .padding(.top, 25)
            
            HStack(spacing: 22) {
                Image(systemName: "moon.fill")
                    .font(.title)
                
                Text("Dark Mode")
                
                Spacer()
                
                Button(action: {
                    
                    self.isDarkMode.toggle()
                    UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.isDarkMode ? .dark : .light
                    
                }) {
                    Image("")
                        .font(.title)
                        .rotationEffect(.init(degrees: self.isDarkMode ? 180 : 0))
                }
            }
            .padding(.top, 25)
            
            Group {
                Button(action: {
                    
                }) {
                    HStack(spacing: 22) {
                        Image("story")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.yellow)
                        
                        Text("Story")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                Button(action: {
                    
                }) {
                    HStack(spacing: 22) {
                        Image("chat")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.pink)
                        
                        Text("Chat")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                Divider()
                    .padding(.top, 25)
                
                Button(action: {
                    
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.purple)
                        
                        Text("Media And Photos")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                Button(action: {
                    
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.purple)
                        
                        Text("Settings And Privacy")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                Button(action: {
                    
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.purple)
                        
                        Text("Help Center")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
                
                Button(action: {
                    
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.purple)
                        
                        Text("Notification")
                        
                        Spacer()
                    }
                }
                .padding(.top, 25)
            }
            
            Spacer()
        }
        .foregroundColor(.primary)
        .padding(.horizontal, 20)
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .background((self.isDarkMode ? Color.black : Color.white).edgesIgnoringSafeArea(.all))
        .overlay(Rectangle().stroke(Color.primary.opacity(0.2), lineWidth: 2).shadow(radius: 3).edgesIgnoringSafeArea(.all))
    }
}
