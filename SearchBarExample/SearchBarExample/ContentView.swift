//
//  ContentView.swift
//  SearchBarExample
//
//  Created by 김태성 on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var datas = ["hello", "hi", "welcome", "world", "swift", "iOS"]
    @State var text = ""
    var body: some View {
        VStack {
            
            SearchView(text: $text)
            
            List(datas.filter{ text == "" ? true : $0.localizedStandardContains(text)}, id: \.self) { i in
                Text(i)
                    .fontWeight(.heavy)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct SearchView: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeCoordinator() -> Coordinator {
        return SearchView.Coordinator(parentView: self )
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        
        let searchbar = UISearchBar()
        searchbar.barStyle = .default
        searchbar.autocapitalizationType = .none
        searchbar.delegate = context.coordinator
        
        return searchbar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        var parentView: SearchView
        
        init(parentView: SearchView) {
            self.parentView = parentView
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            parentView.text = searchText
        }
    }
}
