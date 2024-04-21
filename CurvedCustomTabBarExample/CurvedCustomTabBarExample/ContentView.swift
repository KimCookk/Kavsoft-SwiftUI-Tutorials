//
//  ContentView.swift
//  CurvedCustomTabBarExample
//
//  Created by 김태성 on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack(alignment: .top, content: {
                BottomBar(selected: $selected)
                    .padding()
                    .padding(.horizontal, 22)
                    .background(CurvedShape())
                
                Button(action: {
                    
                }) {
                    Image(systemName: "questionmark.circle")
                        .renderingMode(.original)
                        .padding(18)
                }
                .background(.yellow)
                .clipShape(Circle())
                .offset(y: -15)
                .shadow(radius: 5)
            })
            
        }
        .background(.gray)
        .edgesIgnoringSafeArea(.vertical)
    }
        
}

#Preview {
    ContentView()
}

struct CurvedShape: View {
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 60))
            path.addArc(center: CGPoint(x: UIScreen.main
                .bounds.width / 2, y: 60), radius: 32, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            path.addLine(to: CGPoint(x: 0, y: 60))
        }
        .fill(Color.white)
        .rotationEffect(.init(degrees: 180))
    }
}

struct BottomBar: View {
    
    @Binding var selected: Int
    
    var body: some View {
        HStack {
            
            Button(action: {
                self.selected = 0
            }) {
                Image(systemName: "house")
            }
            .foregroundColor(self.selected == 0 ? .blue  : .black)
            .frame(width: 40, height: 40)
            
            Spacer(minLength: 12)
            
            Button(action: {
                self.selected = 1
            }) {
                Image(systemName: "house")
            }
            .foregroundColor(self.selected == 1 ? .blue  : .black)
            .frame(width: 40, height: 40)

            
            Spacer()
                .frame(width: 120)
            
            Button(action: {
                self.selected = 2
            }) {
                Image(systemName: "house")
            }
            .foregroundColor(self.selected == 2 ? .blue  : .black)
            .frame(width: 40, height: 40)
            
            Spacer(minLength: 12)
            
            Button(action: {
                self.selected = 3
            }) {
                Image(systemName: "house")
            }
            .foregroundColor(self.selected == 3 ? .blue  : .black)
            .frame(width: 40, height: 40)
            
        }
    }
}
