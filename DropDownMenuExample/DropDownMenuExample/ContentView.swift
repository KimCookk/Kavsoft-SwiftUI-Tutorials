//
//  ContentView.swift
//  DropDownMenuExample
//
//  Created by 김태성 on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        DropDownMenu()
    }
}

#Preview {
    ContentView()
}

struct DropDownMenu: View {
    
    @State var expand = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15, content: {
            
            HStack {
                
                Text("Expand").fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Image(systemName: expand ? "chevron.up" : "chevron.down" )
                    .resizable()
                    .frame(width: 10, height: 6)
                    .foregroundColor(.white)
                
            }
            .onTapGesture {
                self.expand.toggle()
            }
            
            if(expand == true) {
                Button(action: {
                    
                }, label: {
                    Text("Select 1")
                })
                .foregroundColor(.white)
                
                Button(action: {
                    
                }, label: {
                    Text("Select 2")
                })
                .foregroundColor(.white)
                
                Button(action: {
                    
                }, label: {
                    Text("Select 3")
                })
                .foregroundColor(.white)
            }
        })
        .padding(20)
        .background(LinearGradient(gradient: .init(colors: [.red, .orange]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .animation(.spring)
    }
}
