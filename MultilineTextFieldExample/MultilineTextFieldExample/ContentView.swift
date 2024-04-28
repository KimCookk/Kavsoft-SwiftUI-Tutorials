//
//  ContentView.swift
//  MultilineTextFieldExample
//
//  Created by 김태성 on 4/28/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var obj: Observed
    
    var body: some View {
        VStack {
            
            MultiLineTextFiled()
                .frame(height: self.obj.size)
                .padding(15)
                .background(.yellow)
                .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(Observed())
}

struct MultiLineTextFiled: UIViewRepresentable {
    
    func makeCoordinator() -> MultiLineTextFiled.Coordinator {
        return MultiLineTextFiled.Coordinator(parent: self)
    }
    
    @EnvironmentObject var object: Observed
    
    func makeUIView(context: UIViewRepresentableContext<MultiLineTextFiled>) -> UITextView {
        let view = UITextView()
        view.font = .systemFont(ofSize: 19)
        view.text = "Type Something"
        view.textColor = UIColor.black.withAlphaComponent(0.35)
        view.backgroundColor = .clear
        view.delegate = context.coordinator
        
        self.object.size = view.contentSize.height
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.isScrollEnabled = true
        
        return view
    }
    
    func updateUIView(_ uiView: MultiLineTextFiled.UIViewType, context: UIViewRepresentableContext<MultiLineTextFiled>) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        var parent: MultiLineTextFiled
        
        init(parent: MultiLineTextFiled) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            
            textView.text = ""
            textView.textColor = .black
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.object.size = textView.contentSize.height
        }
    }
}

class Observed: ObservableObject {
    
    @Published var size: CGFloat = 0
}
