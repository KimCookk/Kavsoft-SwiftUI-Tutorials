//
//  ContentView.swift
//  BottomTabView
//
//  Created by 김태성 on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HousePage()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("house")
                            .fontWeight(.light)
                    }
                }
            
            FlamePage()
                .tabItem {
                    VStack {
                        Image(systemName: "flame.fill")
                        Text("flame")
                            .fontWeight(.light)
                    }
                }
            
            PaperplanePage()
                .tabItem {
                    VStack {
                        Image(systemName: "paperplane.fill")
                        Text("paperplane")
                            .fontWeight(.light)
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}

struct HousePage: View {
    var body: some View {
        Text("Hello from HousePage")
            .fontWeight(.heavy)
    }
}

struct FlamePage: View {
    var body: some View {
        Text("Hello from FlamePage")
            .fontWeight(.heavy)
    }
}

struct PaperplanePage: View {
    var body: some View {
        Text("Hello from PaperplanePage")
            .fontWeight(.heavy)
    }
}
