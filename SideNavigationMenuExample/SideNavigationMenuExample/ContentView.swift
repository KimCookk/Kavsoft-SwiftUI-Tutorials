//
//  ContentView.swift
//  SideNavigationMenuExample
//
//  Created by 김태성 on 4/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var size = UIScreen.main.bounds.width / 1.6
    
    var body: some View {
        ZStack {
            
            NavigationView {
                
                List(0..<5) { index in
                    Text("\(index + 1). Content")
                }
                .navigationTitle("Home")
                .navigationBarItems(leading: Button(action: {
                    self.size = 0
                }, label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                }))
            }
            
            HStack {
                Menu(size: $size)
                    .padding(.leading, -size)
                    .offset(x: -size)
                
                Spacer()
            }
            .animation(.spring())
        }
    }
}

#Preview {
    ContentView()
}

struct Menu: View {
    
    @Binding var size: CGFloat
    
    var body: some View {
        VStack(spacing: 30) {
            
            HStack {
                Spacer()
                
                Button(action: {
                    self.size = UIScreen.main.bounds.width / 1.6
                }, label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                })
                .padding()
            }
            
            HStack {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.leading, 15)
                
                Text("Home")
                    .fontWeight(.heavy)
                
                Spacer()
            }
            
            HStack {
                Image(systemName: "folder.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.leading, 15)
                
                Text("Files")
                    .fontWeight(.heavy)
                
                Spacer()
            }
            
            HStack {
                Image(systemName: "paperplane.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.leading, 15)
                
                Text("Send")
                    .fontWeight(.heavy)
                
                Spacer()
            }
            
            HStack {
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(.leading, 15)
                
                Text("Write")
                    .fontWeight(.heavy)
                
                Spacer()
            }
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(.gray)
    }
}
