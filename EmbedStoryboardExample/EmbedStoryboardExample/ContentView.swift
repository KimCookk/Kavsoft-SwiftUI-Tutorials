//
//  ContentView.swift
//  EmbedStoryboardExample
//
//  Created by 김태성 on 4/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        CustomController()
    }
}

#Preview {
    ContentView()
}

struct CustomController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CustomController>) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "CustomStoryboardView", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "Home")
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
