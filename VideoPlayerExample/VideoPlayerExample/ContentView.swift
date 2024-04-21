//
//  ContentView.swift
//  VideoPlayerExample
//
//  Created by 김태성 on 4/21/24.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        VStack {
            
            Player()
                .frame(height: UIScreen.main.bounds.height / 3)
            Spacer()
        }
        
    }
}

#Preview {
    ContentView()
}

struct Player: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Player>) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        let urlString = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
        let avPlayer = AVPlayer(url: URL(string: urlString)!)
        
        controller.player = avPlayer
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<Player>) {
        
    }
}
