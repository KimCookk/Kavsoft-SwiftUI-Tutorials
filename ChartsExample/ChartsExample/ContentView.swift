//
//  ContentView.swift
//  ChartsExample
//
//  Created by 김태성 on 5/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 8) {
            ForEach(sampleDatas) {  sampleData in
                ChartsBar(percent: sampleData.percent, day: sampleData.day)
            }
        }
        .frame(height: 250)
    }
}

#Preview {
    ContentView()
}

struct ChartsBar: View {
    
    var percent: CGFloat
    var day = ""
    
    var body: some View {
        
        VStack {
            Text("\(String(format: "%.0f", Double(percent)) + "%")")
                .foregroundColor(.black.opacity(0.5))
            
            Rectangle()
                .fill(Color.red)
                .frame(width: UIScreen.main.bounds.width / 10,
                       height: getHeight())
            
            Text("\(day)")
                .foregroundColor(.black.opacity(0.5))
        }
    }
    
    func getHeight() -> CGFloat {
        return 200 / 100 * percent
    }
}

// Sample Datas

struct SampleData: Identifiable {
    
    var id: Int
    var percent: CGFloat
    var day: String
}

var sampleDatas = [
SampleData(id: 0, percent: 35, day: "Mon"),
SampleData(id: 1, percent: 55, day: "Tue"),
SampleData(id: 2, percent: 75, day: "Wed"),
SampleData(id: 3, percent: 25, day: "Thu"),
SampleData(id: 4, percent: 95, day: "Fri"),
SampleData(id: 5, percent: 15, day: "Sat"),
SampleData(id: 6, percent: 65, day: "Sun")
]
