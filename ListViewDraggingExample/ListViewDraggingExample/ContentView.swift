//
//  ContentView.swift
//  ListViewDraggingExample
//
//  Created by 김태성 on 4/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       CustomView()
    }
}

#Preview {
    ContentView()
}

struct CustomView: View {
    
    @State var datas = ["1", "2", "3", "4", "5", "6"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(datas, id: \.self) { i in
                    Text(i)
                }.onDelete(perform: { index in
                    self.datas.remove(atOffsets: index)
                }).onMove(perform: { index, destination in
                    self.datas.move(fromOffsets: index, toOffset: destination)
                })
            }
            .navigationTitle("ListView")
            .navigationBarItems(trailing: EditButton())
        }
    }
}
