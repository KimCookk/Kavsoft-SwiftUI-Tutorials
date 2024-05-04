//
//  ContentView.swift
//  CustomEmojiKeyboardExample
//
//  Created by 김태성 on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var text = ""
    @State var isShow = false;
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            GeometryReader { geo in
                HStack(spacing: 15, content: {
                    TextField("", text: self.$text)
                    
                    Spacer()
                    
                    Button(action: {
                        UIApplication.shared.windows.first?.rootViewController?.view.endEditing(true)
                        isShow.toggle()
                    }, label: {
                        Image(systemName: "smiley")
                            .foregroundColor(.black.opacity(0.5))
                    })
                })
                .padding(12)
                .background(.white)
                .clipShape(Capsule())
                .position(CGPoint(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY))
                
                
            }
            .padding(.horizontal)
            
            
            EmojiView(show: $isShow, text: $text)
                .offset(y: isShow ? (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! : UIScreen.main.bounds.height)
        }
        .background(Color.color)
        .ignoresSafeArea(.all)
        .animation(.default)
        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification, object: nil, queue: .main) { Notification in
                
                self.isShow = false
            }
        }
    }
}

#Preview {
    ContentView()
}

struct EmojiView: View {
    @Binding var show: Bool
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 15, content: {
                    ForEach(self.getEmojiList(), id: \.self) { emojis in
                        HStack(spacing: 25) {
                            ForEach(emojis, id: \.self) { emoji in
                                
                                if let emojiIcon = UnicodeScalar(emoji) {
                                    Button(action: {
                                        self.text += String(emojiIcon)
                                    }, label: {
                                        if(emojiIcon.properties.isEmoji) {
                                            Text(String(emojiIcon))
                                                .font(.system(size: 55))
                                        }
                                    })
                                }
                            }
                        }
                    }
                })
                       
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.white)
            .cornerRadius(25)
            
            Button(action: {
                show.toggle()
            }, label: {
                Image(systemName: "xmark")
            })
            .foregroundColor(.black)
            .padding()
        }
    }
    
    func getEmojiList() -> [[Int]] {
        var emojiList: [[Int]] = []
        
        for i in stride(from: 0x1F601, to: 0x1F64F, by: 4) {
            
            var temp: [Int] = []
            
            for j in i...i+3 {
                temp.append(j)
            }
            
            emojiList.append(temp)
        }
        
        return emojiList
    }
}
