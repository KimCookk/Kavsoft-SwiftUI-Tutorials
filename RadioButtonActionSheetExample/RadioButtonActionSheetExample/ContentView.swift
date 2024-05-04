//
//  ContentView.swift
//  RadioButtonActionSheetExample
//
//  Created by 김태성 on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    @State var selected: String = ""
    @State var isShow: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    
                    isShow.toggle()
                    
                }) {
                    
                    Text("Open")
                        
                }
                .padding(.vertical)
                .padding(.horizontal, 30)
                .foregroundColor(.white)
                .background(LinearGradient(colors: [.color, .color1], startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                
                Text(selected)
            }
            
            VStack {
                if(!isShow) {
                    Spacer()
                } else {
                    Spacer()
                    
                    RadioButtons(selected: $selected, isShow: $isShow)
                }
            }
            .animation(.spring)
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color(.color2).onTapGesture {
            isShow = false
        })
        .ignoresSafeArea(.all)
    }
}

#Preview {
    ContentView()
}

var contentData = ["Revelance", "Newest","Price(low to hight)", "Price(hight to low)", "Sort by Specs", "Sort by Storage"];

struct RadioButtons: View {
    @Binding var selected: String
    @Binding var isShow: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Filter By")
                .font(.title)
                .padding()
            
            ForEach(contentData, id: \.self) { data in
                Button(action: {
                    selected = data
                }, label: {
                    HStack {
                        Text(data)
                        
                        Spacer()
                        
                        ZStack {
                            
                            Circle()
                                .fill( selected == data ? .color1 : Color.black.opacity(0.2))
                                .frame(width: 20, height: 20)
                            
                            Circle()
                                .stroke(selected == data ? .color1 : .white, lineWidth: 2)
                                .frame(width: 26, height: 26)
                            
                        }
                    }
                    .foregroundColor(.black)
                })
                .padding(.top)
            }
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    isShow.toggle()
                }, label: {
                    Text("Continue")
                        .padding(.vertical)
                        .padding(.horizontal, 25)
                        .foregroundColor(.white)
                })
                .background( selected != "" ? LinearGradient(colors: [.color, .color1], startPoint: .leading, endPoint: .trailing) : LinearGradient(colors: [.black.opacity(0.2), .black.opacity(0.2)], startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .disabled(selected == "")
                
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        .background(.white)
        .cornerRadius(30)
    }
}
