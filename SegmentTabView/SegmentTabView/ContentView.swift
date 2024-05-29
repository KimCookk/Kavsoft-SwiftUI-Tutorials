//
//  ContentView.swift
//  SegmentTabView
//
//  Created by 김태성 on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       MainView()
    }
}

#Preview {
    ContentView()
}

struct MainView: View {
    
    @State var index: Int = 1
    @State var offset: CGFloat = 0
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack(spacing: 0) {
            
            AppBar(index: self.$index, offset: self.$offset)
            
            GeometryReader { geo in
                HStack(spacing: 0) {
                    
                    HomeView()
                        .frame(width: geo.frame(in: .global).width)
                    
                    SearchView()
                        .frame(width: geo.frame(in: .global).width)
                    
                    AccountView()
                        .frame(width: geo.frame(in: .global).width)
                }
                .offset(x: self.offset)
                .highPriorityGesture(DragGesture()
                    .onChanged({value in
                        print(value.translation)
                    })
                    .onEnded({ value in
                        print(value.translation)
                        if value.translation.width > 50 {
                            changeView(left: false)
                        }
                        
                        if -value.translation.width > 50 {
                            changeView(left: true)
                        }
                    }))
            }
        }
        .animation(.default)
        .edgesIgnoringSafeArea(.all)
    }
    
    func changeView(left: Bool) {
        if left {
            if index > 1 {
                index = index - 1
            }
        } else {
            if index < 3 {
                index = index + 1
            }
        }
        
        
    }
}

struct AppBar: View {
    
    @Binding var index: Int
    @Binding var offset: CGFloat
    
    var width = UIScreen.main.bounds.width
    
    var body: some View {
        
        VStack(alignment: .leading, content: {
            Text("Main")
                .font(.title)
                .foregroundColor(.white)
                .padding(.leading)
                .padding(.bottom)
            
            HStack {
                Button(action: {
                    self.index = 1
                    self.offset = 0
                }) {
                    
                    VStack(spacing: 8) {
                        
                        HStack(spacing: 12) {
                            
                            Image(systemName: "house")
                                .foregroundColor(self.index == 1 ? .white : .white.opacity(0.7))
                            
                            Text("Home")
                                .foregroundColor(self.index == 1 ? .white : .white.opacity(0.7))
                            
                        }
                        
                        Capsule()
                            .fill(self.index == 1 ? .white : .white.opacity(0.7))
                            .frame(height: 4)
                    }
                }
                
                Button(action: {
                    self.index = 2
                    self.offset = -self.width
                    
                }) {
                    
                    VStack(spacing: 8) {
                        
                        HStack(spacing: 12) {
                            
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(self.index == 2 ? .white : .white.opacity(0.7))
                            
                            Text("Search")
                                .foregroundColor(self.index == 2 ? .white : .white.opacity(0.7))
                            
                        }
                        
                        Capsule()
                            .fill(self.index == 2 ? .white : .white.opacity(0.7))
                            .frame(height: 4)
                    }
                }
                
                Button(action: {
                    self.index = 3
                    self.offset = -self.width * 2
                }) {
                    
                    VStack(spacing: 8) {
                        
                        HStack(spacing: 12) {
                            
                            Image(systemName: "person")
                                .foregroundColor(self.index == 3 ? .white : .white.opacity(0.7))
                            
                            Text("Account")
                                .foregroundColor(self.index == 3 ? .white : .white.opacity(0.7))
                            
                        }
                        
                        Capsule()
                            .fill(self.index == 3 ? .white : .white.opacity(0.7))
                            .frame(height: 4)
                    }
                }
            }

        })
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
        .padding(.horizontal)
        .padding(.bottom, 8)
        .background(Color.red)
    }
}

struct HomeView: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("Home View")
            }
        }
    }
}

struct SearchView: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("Search View")
            }
        }
    }
}

struct AccountView: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("Account View")
            }
        }
    }
}
