//
//  ContentView.swift
//  ResizableHeader
//
//  Created by 김태성 on 5/23/24.
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
    
    @State var index = 0
    @State var isShow = false
    
    var body: some View {
        VStack(spacing: 0) {
            AppBar(index: self.$index, isShow: self.$isShow)
            
            if(index == 0) {
                ChatsView(isShow: self.$isShow)
            }
            
            else if (index == 1) {
                StatusView()
            }
            
            else if (index == 2) {
                CallsView()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct AppBar: View {
    
    @Binding var index: Int
    @Binding var isShow: Bool
    
    var body: some View {
        VStack(spacing: 25) {
            
            if self.isShow {
                HStack {
                    Text("WhatsApp")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "list.bullet")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.white)
                    }
                    .padding(.leading)
                }

            }
            
            HStack {
                
                Button(action: {
                    self.index = 0
                }) {
                    VStack {
                        Text("Chats")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 0 ? .bold : .none)
                        
                        Capsule()
                            .fill(self.index == 0 ? .white : .clear)
                            .frame(height: 4)
                    }
                }
                
                Button(action: {
                    self.index = 1
                }) {
                    VStack {
                        Text("Status")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 1 ? .bold : .none)
                        
                        Capsule()
                            .fill(self.index == 1 ? .white : .clear)
                            .frame(height: 4)
                    }
                }
                
                Button(action: {
                    self.index = 2
                }) {
                    VStack {
                        Text("Calls")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 2 ? .bold : .none)
                        
                        Capsule()
                            .fill(self.index == 2 ? .white : .clear)
                            .frame(height: 4)
                    }
                }
                
            }
            .padding(.bottom, 10)
        }
        .padding(.horizontal)
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10)
        .background(.accent)
    }
}

struct ChatsView: View {
    
    @Binding var isShow: Bool
    
    var body: some View {
        List(0..<25) { i in
            if i == 0 {
                CellView()
                    .onAppear {
                        withAnimation {
                            self.isShow = true
                        }
                    }
                    .onDisappear {
                        withAnimation {
                            self.isShow = false
                        }
                    }
            } else {
                CellView()
            }
        }
    }
}

struct CellView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Elisa")
                
                Text("Msg")
                    .font(.caption)
            }
        }
    }
}

struct StatusView: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("Status")
            }
        }
    }
}

struct CallsView: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("Calls")
            }
        }
    }
}
