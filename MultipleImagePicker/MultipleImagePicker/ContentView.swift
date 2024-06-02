//
//  ContentView.swift
//  MultipleImagePicker
//
//  Created by 김태성 on 6/2/24.
//

import SwiftUI
import Photos

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

#Preview {
    ContentView()
}

struct HomeView: View {
    
    @State var selected: [UIImage] = []
    @State var datas: [ImageData] = []
    @State var isShowImagePicker: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.07).edgesIgnoringSafeArea(.all)
            
            VStack {
                Button(action: {
                    self.selected.removeAll()
                    isShowImagePicker = true
                }) {
                    Text("Image Picker")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width / 2)
                }
                .background(.red)
                .clipShape(Capsule())
            }
            
            if isShowImagePicker {
                ImagePickerView(selected: self.$selected, datas: self.$datas, isShow: self.$isShowImagePicker)
            }
           
        }
    }
}

struct ImagePickerView: View {
    
    @Binding var selected: [UIImage]
    @Binding var datas: [ImageData]
    @Binding var isShow: Bool
    
    @State var grid: [Int] = []
    
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                HStack {
                    Text("Pick a Image")
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.leading)
                .padding(.top)
                
                if !self.datas.isEmpty {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            ForEach(self.datas, id: \.self) { i in
                                ForEach(i..<i+3, id:\.self) { j in
                                    ImageCardView(data: self.datas[j])
                                }
                            }
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.height / 1.5)
            .background(.white)
            .cornerRadius(12)
        }
        .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all))
        .onTapGesture {
            self.isShow.toggle()
        }
        .onAppear {
            PHPhotoLibrary.requestAuthorization { (status) in
                if status == .authorized {
                    
                    self.getAllImages()
                } else {
                    
                    print("not authorized")
                }
            }
        }
    }
    
    func getAllImages() {
        let req = PHAsset.fetchAssets(with: .image, options: .none)
        
        DispatchQueue.global(qos: .background).async {
            req.enumerateObjects { (asset, _, _) in
                
                let options = PHImageRequestOptions()
                options.isSynchronous = true
                
                PHCachingImageManager.default().requestImage(for: asset, targetSize: .init(), contentMode: .default, options: options) { (image, _) in
                    
                    if let image = image {
                        let data = ImageData(image: image, selected: false)
                        self.datas.append(data)
                    }
                }
                
                if req.count == self.datas.count {
                    self.getGrid()
                }
            }
        }
    }
    
    func getGrid() {
        for i in stride(from: 0, to: self.datas.count, by: 3) {
            
            self.grid.append(i)
        }
    }
}

struct ImageData: Hashable {
    var image: UIImage
    var selected: Bool
}

struct ImageCardView: View {
    
    var data: ImageData
    
    var body: some View {
        
        Image(uiImage: self.data.image)
            .resizable()
            .frame(width: (UIScreen.main.bounds.width - 80) / 3, height: 90)
    }
}
