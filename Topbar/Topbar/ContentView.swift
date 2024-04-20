//
//  ContentView.swift
//  Topbar
//
//  Created by 김태성 on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentTab = 0
     
    var body: some View {
        VStack {
            Picker(selection: $currentTab, label: Text("")) {
                
                Image(systemName: "house.fill")
                    .tag(0)
                
                Image(systemName: "flame.fill")
                    .tag(1)
                
                Image(systemName: "paperplane.fill")
                    .tag(2)
            }
            .pickerStyle(.segmented )
            .padding(.top, 10)
            
            Spacer()
            
            if(currentTab == 0) {
                HousePage()
            } else if (currentTab == 1) {
                FlamePage()
            } else if (currentTab == 2) {
                PaperPlanePage()
            }
                        
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct HousePage: View {
    var body: some View {
        Text("house Page")
            .fontWeight(.heavy)
    }
}

struct FlamePage: View {
    var body: some View {
        Text("flame Page")
            .fontWeight(.heavy)
    }
}

struct PaperPlanePage: View {
    var body: some View {
        Text("paper plane Page")
            .fontWeight(.heavy)
    }
}
