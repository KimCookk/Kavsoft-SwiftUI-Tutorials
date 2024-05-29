//
//  ContentView.swift
//  CustomPopOvers
//
//  Created by 김태성 on 5/27/24.
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
    @State var show = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            VStack {
                HStack {
                    Text("PopOver")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 15)
                .padding()
                .background(Color.purple)
                
                Spacer()
            }
            
            VStack(alignment: .center, spacing: 15) {
                
                if self.show {
                    PopOverView()
                        .background(Color.white)
                        .clipShape(ArrowShape())
                        .cornerRadius(15)
                        .offset(y: 10)
                }
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        self.show.toggle()
                    }
                    
                }) {
                    Image(systemName: self.show ? "xmark" : "arrow.up")
                        .resizable()
                        .frame(width: 20, height: 22)
                        .foregroundColor(.purple)
                        .padding()
                }
                .background(Color.white)
                .clipShape(Circle())
            }
            .padding()
        })
        .edgesIgnoringSafeArea(.top)
        .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all))
    }
}

struct PopOverView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Button(action: {
                
            }) {
                HStack(spacing: 15) {
                    Image(systemName: "house")
                        .renderingMode(.original)
                    
                    Text("Home")
                }
            }
            
            Divider()
            
            Button(action: {
                
            }) {
                HStack(spacing: 15) {
                    Image(systemName: "house")
                        .renderingMode(.original)
                    
                    Text("Search")
                }
            }
            
            Divider()
            
            Button(action: {
                
            }) {
                HStack(spacing: 15) {
                    Image(systemName: "house")
                        .renderingMode(.original)
                    
                    Text("Likes")
                }
            }
            
            Divider()
            
            Button(action: {
                
            }) {
                HStack(spacing: 15) {
                    Image(systemName: "house")
                        .renderingMode(.original)
                    
                    Text("Account")
                }
            }
        }
        .foregroundColor(.black)
        .frame(width: 140)
        .padding()
        .padding(.bottom, 20)
    }
}

struct ArrowShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let center = rect.width / 2
        
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - 20))
            
            path.addLine(to: CGPoint(x: center - 15, y: rect.height - 20))
            path.addLine(to: CGPoint(x: center, y: rect.height))
            path.addLine(to: CGPoint(x: center + 15, y: rect.height - 20))
            
            path.addLine(to: CGPoint(x: 0, y: rect.height - 20))
        }
    }
}
