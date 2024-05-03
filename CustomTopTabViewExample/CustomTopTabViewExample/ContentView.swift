//
//  ContentView.swift
//  CustomTopTabViewExample
//
//  Created by 김태성 on 5/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected = 0
    
    var body: some View {
        VStack {
            TopBar(selected: self.$selected)
            
            GeometryReader { _ in
                
                VStack {
                    Text("Selected Top Bar \(selected)")

                }
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}

class HostViewController: UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

struct TopBar: View {
    
    @Binding var selected: Int
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("WhatsApp")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "plus")
                        .font(.headline)
                        .foregroundColor(.white)
                            
                })
            }
            
            HStack() {
                Button(action: {
                    self.selected = 0
                }, label: {
                    Text("Chats")
                        .fontWeight(.semibold)
                        .foregroundColor(selected == 0 ? .white : .white.opacity(0.5))
                })
                
                Spacer(minLength: 8)
                
                Button(action: {
                    self.selected = 1
                }, label: {
                    Text("Groups")
                        .fontWeight(.semibold)
                        .foregroundColor(selected == 1 ? .white : .white.opacity(0.5))
                })
                
                Spacer(minLength: 8)
                
                Button(action: {
                    self.selected = 2
                }, label: {
                    Text("Status")
                        .fontWeight(.semibold)
                        .foregroundColor(selected == 2 ? .white : .white.opacity(0.5))
                })
                
                Spacer(minLength: 8)
                
                Button(action: {
                    self.selected = 3
                }, label: {
                    Text("Active")
                        .fontWeight(.semibold)
                        .foregroundColor(selected == 3 ? .white : .white.opacity(0.5))
                })
            }
        }
        .padding()
        .background(.green)
    }
}
