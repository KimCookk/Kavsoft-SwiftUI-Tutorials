//
//  ContentView.swift
//  SDWebImageDownloadExample
//
//  Created by 김태성 on 4/23/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @State var url = "https://www.gstatic.com/webp/gallery/1.jpg"
    @State var isOn = true;
    
    var body: some View {
        
        AnimatedImage(url: URL(string: url))
            .resizable()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
            .onTapGesture {
                if(isOn) {
                    url = "https://www.gstatic.com/webp/gallery/5.jpg"
                } else {
                    url = "https://www.gstatic.com/webp/gallery/1.jpg"
                }
                
                isOn.toggle()
            }
    }
}

#Preview {
    ContentView()
}
