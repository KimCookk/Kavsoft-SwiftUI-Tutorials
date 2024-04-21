//
//  ContentView.swift
//  ImagePickerExample
//
//  Created by 김태성 on 4/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var imageData = Data(capacity: 0)
    @State var isShown = false
    
    var body: some View {
        VStack {
            
            if imageData.isEmpty == false {
                Image(uiImage: UIImage(data: imageData)!)
                    .resizable()
                    .frame(height: 300)
                    .padding()
                    .cornerRadius(20)
            }
            
            Button(action: {
                isShown.toggle()
            }, label: {
                Text("Select Image")
            })
            .sheet(isPresented: $isShown, content: {
                Picker(isShown: $isShown, imageData: $imageData)
            })
        }
//      .animation(.spring, value: )
        .padding()
    }
}

#Preview {
    ContentView()
}

struct Picker: UIViewControllerRepresentable {
    
    @Binding var isShown: Bool
    @Binding var imageData: Data
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(imageData: $imageData, isShown: $isShown)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Picker>) -> UIImagePickerController{
        
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<Picker>) {
        
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        @Binding var imageData: Data
        @Binding var isShown: Bool
        
        init(imageData: Binding<Data>, isShown: Binding<Bool>) {
            _imageData = imageData
            _isShown = isShown
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isShown.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as! UIImage
            imageData = image.jpegData(compressionQuality: 80)!
            isShown.toggle()
        }
    }
}
