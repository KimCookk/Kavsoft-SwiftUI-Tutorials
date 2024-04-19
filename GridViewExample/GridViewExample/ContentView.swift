//
//  ContentView.swift
//  GridViewExample
//
//  Created by 김태성 on 4/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        grid()
    }
}

struct grid: View {
    var body: some View {
        
        GeometryReader { geo in
        
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(1..<6) { i  in
                        HStack {
                            Image("number\(i)")
                                .resizable()
                                .frame(width: geo.size.width / 2 - 20)
                                .cornerRadius(15)
                            
                            Image("number\(i)")
                                .resizable()
                                .frame(width: geo.size.width / 2 - 20)
                                .cornerRadius(15)
                        }
                        .frame(height: UIDevice.current.orientation.isLandscape ? 300 : 150)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
