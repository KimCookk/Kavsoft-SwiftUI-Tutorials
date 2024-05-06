//
//  ContentView.swift
//  CustomPickerView
//
//  Created by 김태성 on 5/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected = "Monday"
    
    var body: some View {
        ZStack {
            
            Color.purple.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(self.selected).padding().foregroundColor(.white)
                
                Spacer()
                    
                CustomPicker(selected: $selected)
                
                Spacer()
            }

        }
    }
}

#Preview {
    ContentView()
}

struct CustomPicker: UIViewRepresentable {
    
    @Binding var selected: String
    
    func makeCoordinator() -> CustomPicker.Coordinaotr {
        return CustomPicker.Coordinaotr(parent: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<CustomPicker>) -> UIPickerView {
        
        let picker = UIPickerView()
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIView(_ uiView: UIPickerView, context: UIViewRepresentableContext<CustomPicker>) {
        
    }
    
    class Coordinaotr: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
        
        var parent: CustomPicker
        
        init(parent: CustomPicker) {
            self.parent = parent
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return pickerData.count
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pickerData[row];
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 100, height: 60))
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
            label.text = pickerData[row]
            label.textColor = .white
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 22, weight: .bold)
            
            view.clipsToBounds = true
            view.layer.cornerRadius = view.bounds.height / 2
            
            view.addSubview(label)
            
            view.layer.borderWidth = 2.5
            view.layer.borderColor = UIColor.white.cgColor
            
            return view
        }
        
        func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
            
            return UIScreen.main.bounds.width - 100
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 60
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.parent.selected = pickerData[row]
        }
    }
}


var pickerData = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
