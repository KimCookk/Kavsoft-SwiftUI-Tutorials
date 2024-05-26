//
//  ContentView.swift
//  SlideOutMenu
//
//  Created by 김태성 on 5/25/24.
//

import SwiftUI

let data = ["Home", "Orders", "Wishlist", "Saved Cards", "Settings", "Help"]

struct ContentView: View {
    
    @State var index = "Home"
    @State var isShow = false
    
    var body: some View {
        
        ZStack {
            (self.isShow ? Color.black.opacity(0.05) : Color.clear).edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 15) {
                    HStack(spacing: 15) {
                        Image("developer")
                            .resizable()
                        .frame(width: 65, height: 65)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Catherine")
                                .fontWeight(.bold)
                            
                            Text("New York, US")
                        }
                        .padding(.bottom, 50)
                    }
                    
                    ForEach(data, id:\.self) { i in
                        Button(action: {
                            
                            self.index = i
                            
                            withAnimation(.spring()) {
                                self.isShow.toggle()
                            }
                            
                        }) {

                            HStack{
                                Capsule()
                                    .fill(self.index == i ? Color.orange : Color.clear)
                                    .frame(width: 5, height: 20)
                                
                                Text(i)
                                    .padding(.leading)
                                    .foregroundColor(.black)
                            }
                            .padding(.vertical)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.leading)
                .padding(.top)
                
                ZStack(alignment: .topTrailing) {
                    
                    MainView(isShow: self.$isShow, index: self.$index)
                        .scaleEffect(self.isShow ? 0.8 : 1)
                        .offset(x: self.isShow ? 150 : 0, y: self.isShow ? 50 : 0)
                        .disabled(self.isShow ? true : false)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            self.isShow.toggle()
                        }
                        
                    }) {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .opacity(self.isShow ? 1 : 0)
                }
            }
        }
        .animation(.default)
    }
}

#Preview {
    ContentView()
}

struct MainView: View {
    @Binding var isShow: Bool
    @Binding var index: String

    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    Button(action: {
                        withAnimation(.spring()) {
                            self.isShow.toggle()
                        }
                        
                    }) {
                        Image(systemName: "list.bullet")
                            .resizable()
                            .frame(width: 20, height: 15)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .frame(width: 20, height: 10)
                            .foregroundColor(.black)
                    }
                }
                
                Text("Food")
                    .fontWeight(.bold)
                    .font(.title)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            ZStack {
                HomeView().opacity(self.index == "Home" ? 1:0)
                
                OrdersView().opacity(self.index == "Orders" ? 1:0)
                
                WishlistView().opacity(self.index == "Wishlist" ? 1:0)
                
                SavedCardView().opacity(self.index == "Saved Cards" ? 1:0)
                
                SettingsView().opacity(self.index == "Settings" ? 1:0)
                
                HelpView().opacity(self.index == "Help" ? 1:0)

            }
        }
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 18) {
                ForEach(1...6, id: \.self) { i in
                    Image("\(i)")
                        .resizable()
                        .frame(height: 250)
                        .cornerRadius(20)
                }
            }
            .padding(.top, 8)
            .padding(.horizontal)
        }
    }
}

struct OrdersView: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("Order")
            }
        }
    }
}

struct WishlistView: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("WishList")
            }
        }
    }
}

struct SavedCardView: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("Saved Card")
            }
        }
    }
}


struct SettingsView: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("Settings")
            }
        }
    }
}

struct HelpView: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("Help")
            }
        }
    }
}


