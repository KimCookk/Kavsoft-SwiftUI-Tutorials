//
//  ContentView.swift
//  CustomButtonExample
//
//  Created by 김태성 on 4/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        customButton()
    }
}

#Preview {
    ContentView()
}

struct customButton: View {
    
    @State var count = 15
    var body: some View {
        
        ZStack {
            Button(action: {
                print("clicked")
                self.count -= 1
            }) {
                Image(systemName: "bell.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding()
            .foregroundColor(.white)
            .background(.green)
            .clipShape(Circle())
            
            if count != 0 {
                Text("\(count)")
                    .frame(width: 18, height: 18)
                    .padding(6)
                    .background(.black)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                    .offset(x: 25, y: -25)
            }
        }
        //.animation(.spring())
    }
}
