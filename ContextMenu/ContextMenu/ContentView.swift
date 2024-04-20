//
//  ContentView.swift
//  ContextMenu
//
//  Created by 김태성 on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("grayBox")
            .resizable()
            .frame(height: 300)
            .cornerRadius(20)
            .padding()
            .contextMenu {
                VStack {
                    
                    Button {
                        print("save")
                    } label: {
                        HStack {
                            Image(systemName: "folder.fill")
                            Text("Save to Gallery")
                        }
                    }
                    
                    Button {
                        print("share")
                    } label: {
                        HStack {
                            Image(systemName: "paperplane.fill")
                            Text("Send")
                        }
                    }

                }
            }
    }
}

#Preview {
    ContentView()
}
