//
//  ContentView.swift
//  CollectionGridViewExample
//
//  Created by 김태성 on 5/31/24.
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
    
    @State var data = [
        GameType(name: "GTA 5", pic: "gta"),
        GameType(name: "Resident Evil2", pic: "re2"),
        GameType(name: "Tomb Radier", pic: "tr"),
        GameType(name: "Splinter Cell", pic: "sp")
    ]
    
    @State var grid:[Int] = []
    
    var body: some View {
        VStack(spacing: 0) {
            
            ZStack {
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "rectangle.split.2x2")
                            .resizable()
                            .renderingMode(.original)
                            .foregroundColor(.black)
                            .frame(width: 25, height: 23)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "person")
                            .resizable()
                            .renderingMode(.original)
                            .foregroundColor(.black)
                            .frame(width: 22, height: 24)
                    }
                }
                
                Text("Games")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding()
            
            Spacer()
            
            MainView(data: self.$data, grid: self.$grid)
            
            TabBarView()
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.top))
        .edgesIgnoringSafeArea(.bottom)
        .onAppear {
            self.generateGrid()
        }
    }
    
    func generateGrid() {
        
        for i in stride(from: 0, to: self.data.count, by: 2) {
            
            if i != self.data.count {
                self.grid.append(i)
            }
        }
    }
}

struct TabBarView: View {
    
    @State var index = 0
    
    var body: some View {
        HStack {
            Button(action: {
                self.index = 0
            }) {
                VStack {
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 0 ? .red : .gray)
                    
                    if self.index == 0 {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 8, height: 8)
                            .offset(y: 6)
                    }
                }
            }
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 1
            }) {
                VStack {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 1 ? .red : .gray)
                    
                    if self.index == 1 {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 8, height: 8)
                            .offset(y: 6)
                    }
                }
            }
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 2
            }) {
                VStack {
                    Image(systemName: "ellipsis.bubble")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 2 ? .red : .gray)
                    
                    if self.index == 2 {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 8, height: 8)
                            .offset(y: 6)
                    }
                }
            }
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 3
            }) {
                VStack {
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(self.index == 3 ? .red : .gray)
                    
                    if self.index == 3 {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 8, height: 8)
                            .offset(y: 6)
                    }
                }
            }
        }
        .padding(.horizontal, 35)
        .padding(.top, 12)
        .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 15)
        .background(Color.white)
        .shadow(color: .black.opacity(0.04), radius: 0, x:0, y:  -6)
        .animation(.default)
    }
}

struct GameType {
    var name: String
    var pic: String
}

struct MainView: View {
    
    @Binding var data: [GameType]
    @Binding var grid: [Int]
    var body: some View {
        VStack {
            
            if !self.grid.isEmpty {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 25) {
                        ForEach(self.grid, id: \.self) { i in
                            HStack(spacing:15) {
                                ForEach(i...i+1, id: \.self) { j in
                                    VStack {
                                        if j != self.data.count {
                                            CardView(game: self.data[j])
                                        }
                                    }
                                }
                                
                                if i == self.grid.last && self.data.count % 2 != 0 {
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct CardView: View {
    
    var game: GameType
    
    var body: some View {
        
        VStack(spacing: 15) {
            Image(game.pic)
                .resizable()
                .frame(width: (UIScreen.main.bounds.width - 45) / 2, height: 260)
                .cornerRadius(12)
        
            Text(game.name)
            
            Button(action: {
                
            }) {
                Text("Play Now")
                    .foregroundColor(.white)
                    .frame(width: (UIScreen.main.bounds.width - 70) / 2)
                    .padding(.vertical)
            }
            .background(Color.red)
            .cornerRadius(10)
            .shadow(radius: 6)
        }
    }
}
