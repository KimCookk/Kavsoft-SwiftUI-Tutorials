//
//  ContentView.swift
//  ExpandableSearchBar
//
//  Created by 김태성 on 5/7/24.
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
    @State var searchText = ""
    @State var data = ["p1", "p2", "p3", "p4", "p5"]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                if !self.show {
                    
                    Text("Food")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
                
                HStack {
                    
                    if self.show {
                        Image("search")
                        
                        TextField("Search Food", text: $searchText)
                        
                        
                        Button(action: {
                            
                            withAnimation{
                                self.show.toggle()
                            }
                            
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                        })
                    } else {
                        
                        Button(action: {
                            
                            withAnimation{
                                self.searchText = ""
                                self.show.toggle()
                            }
                            
                        }, label: {
                            Image("search")
                                .foregroundColor(.white)
                                .padding(10)
                        })
                        .background(.white)
                        .clipShape(Circle())
                    }
                }
                .padding(self.show ? 10: 0)
                .background(.white)
                .cornerRadius(20)
                
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
            .background(.orange)
            
            Spacer()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    
                    if self.searchText != "" {
                        if data.filter({ $0.lowercased().contains(self.searchText.lowercased())
                        }).count == 0 {
                            Text("No results Found").padding(.top, 10)
                        } else {
                            ForEach(data.filter({$0.lowercased().contains(self.searchText.lowercased())}), id: \.self) { i in
                                CellView(image: i)
                            }
                        }
                    } else {
                        ForEach(data, id: \.self) { i in
                            CellView(image: i)
                        }
                    }
                }
                .padding(.horizontal, 15)
                .padding(.top, 10)
            }
        }
    }
}

struct CellView: View {
    var image: String
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(image)
                .resizable()
                .frame(height: 200)
                .cornerRadius(20)
            
            Button(action: {
                
            }, label: {
                Image(systemName: "arrow.right")
                    .foregroundColor(.black)
                    .padding()
            })
            .background(.white)
            .clipShape(Circle())
            .padding()
        }
        
    }
}
