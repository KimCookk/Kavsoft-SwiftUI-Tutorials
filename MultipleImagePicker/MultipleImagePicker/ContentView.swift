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
    @State var isShowImagePicker: Bool = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.07).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                if !self.selected.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20 ) {
                            ForEach(self.selected, id: \.self) { i in
                                Image(uiImage: i)
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width - 40, height: 250)
                                    .cornerRadius(15)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }
                
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
                .padding(.top, 25)
            }
            
            if isShowImagePicker {
                ImagePickerView(selected: self.$selected, isShow: self.$isShowImagePicker)
            }
           
        }
    }
}

struct ImagePickerView: View {
    
    @Binding var selected: [UIImage]
    @Binding var isShow: Bool
    
    @State var datas: [ImageData] = []
    @State var grid: [Int] = []
    @State var disabled = false
    
    var body: some View {
            GeometryReader { geo in
                VStack {
                    if !self.grid.isEmpty {
                        headerView()
                        scrollViewContent()
                        
                        Button(action: {
                            self.isShow.toggle()
                        }) {
                            Text("Select")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .frame(width: UIScreen.main.bounds.width / 2)
                        }
                        .background(Color.red.opacity(self.selected.count != 0 ? 1 : 0.5))
                        .clipShape(Capsule())
                        .padding(.bottom, 25)
                        .disabled(self.selected.count != 0 ? false : true)
                    } else {
                        if self.disabled {
                            Text("Enabled Storage Access In Settings !!!!")
                        } else {
                            IndicatorView()
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.height / 1.5)
                .background(Color.white)
                .cornerRadius(12)
                .position(x: geo.size.width / 2, y: geo.size.height / 2) // Center the VStack

            }
            .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all))
            .onTapGesture {
                
                self.isShow.toggle()
            }
            .onAppear {
                PHPhotoLibrary.requestAuthorization { (status) in
                    if status == .authorized {
                        self.getAllImages()
                        self.disabled = false
                    } else {
                        print("not authorized")
                        self.disabled = true
                    }
                }
            }
        }
        
        @ViewBuilder
        private func headerView() -> some View {
            HStack {
                Text("Pick a Image")
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.leading)
            .padding(.top)
        }
        
        @ViewBuilder
        private func scrollViewContent() -> some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(0..<self.grid.count, id: \.self) { i in
                        rowContent(i: i)
                    }
                }
            }
        }
        
        @ViewBuilder
        private func rowContent(i: Int) -> some View {
            HStack(spacing: 8) {
                ForEach(i..<i+3, id: \.self) { j in
                    if j < self.datas.count {
                        ImageCardView(data: self.datas[j], selected: self.$selected)
                    }
                }
                if self.datas.count % 3 != 0 && i == self.grid.last! {
                    Spacer()
                }
            }
            .padding(.leading, (self.datas.count % 3 != 0 && i == self.grid.last!) ? 15 : 0)
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
    
    @State var data: ImageData
    @Binding var selected: [UIImage]
    
    var body: some View {
        
        ZStack {
            Image(uiImage: self.data.image)
                .resizable()
            
            if self.data.selected {
                ZStack {
                    Color.black.opacity(0.5)
                    
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
            }
        }
        .frame(width: (UIScreen.main.bounds.width - 80) / 3, height: 90)
        .onTapGesture {
            
            if !self.data.selected {
                
                self.data.selected = true
                
                self.selected.append(self.data.image)
                
            } else {
                
                for i in 0..<self.selected.count {
                    
                    self.selected.remove(at: i)
                    self.data.selected = false
                    
                    return
                }
            }
        }
    }
}

struct IndicatorView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}
