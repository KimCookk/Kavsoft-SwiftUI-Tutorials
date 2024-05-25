//
//  ContentView.swift
//  CardSwipeExample
//
//  Created by 김태성 on 5/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var x: [CGFloat] = [0, 0, 0, 0, 0, 0, 0]
    @State var degree: [Double] = [0, 0, 0, 0, 0, 0, 0]

    var body: some View {
        
        ZStack {
            Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
            
            ZStack {
                Button(action: {
                    x = [0, 0, 0, 0, 0, 0, 0]
                    degree = [0, 0, 0, 0, 0, 0, 0]
                }) {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .font(.title)
                }
                
                ForEach(0..<7, id: \.self) { i in
                    CardView()
                        .offset(x: self.x[i])
                        .rotationEffect(.init(degrees: self.degree[i]))
                        .gesture(DragGesture()
                            .onChanged({ (value) in
                                if value.translation.width > 0 {
                                    self.x[i] = value.translation.width
                                    self.degree[i] = 8
                                } else {
                                    self.x[i] = value.translation.width
                                    self.degree[i] = -8
                                }
                            })
                            .onEnded({ (value) in
                                if value.translation.width > 0 {
                                    if value.translation.width > 100 {
                                        self.x[i] = 500
                                        self.degree[i] = 15
                                    } else {
                                        self.x[i] = 0
                                        self.degree[i] = 0
                                    }
                                } 
                                else {
                                    if value.translation.width < -100 {
                                        self.x[i] = -500
                                        self.degree[i] = -15
                                    } else {
                                        self.x[i] = 0
                                        self.degree[i] = 0
                                    }
                                }
                            })
                    )
                }
                
                
            }
            .padding()
            .animation(.default)
        }
    }
}

#Preview {
    ContentView()
}

struct CardView: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack {
                Image("developer")
                    .resizable()
                    .frame(height: 400)
                
                HStack(spacing: 25) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "x.circle")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding()
                    }
                    .background(Color.black.opacity(0.02))
                    .clipShape(Circle())
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.purple)
                            .padding()
                    }
                    .background(Color.black.opacity(0.02))
                    .clipShape(Circle())
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "message.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.purple)
                            .padding()
                    }
                    .background(Color.black.opacity(0.02))
                    .clipShape(Circle())
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.purple)
                            .padding()
                    }
                    .background(Color.black.opacity(0.02))
                    .clipShape(Circle())
                }
                .padding(10)
            }
            .background(Color.white)
            .cornerRadius(25)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Cook")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Text("25")
                    .font(.body)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .padding(.bottom, 100)
            .padding(.leading, 200)
        }
    }
}
