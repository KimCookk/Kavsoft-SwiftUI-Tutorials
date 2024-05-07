//
//  ContentView.swift
//  ScrollListView
//
//  Created by 김태성 on 5/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            HomeView()
                .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}

struct HomeView: View {
    
    @ObservedObject var listData = GetData()
    var body: some View {
        
        List(0..<listData.data.count, id: \.self){ i in
            
            //Text(self.listData.data[i].id)
            //CellView(data: self.listData.data[i])
            
            if i == self.listData.data.count - 1 {
                CellView(data: self.listData.data[i], isLast: true, listData: listData)
            } else {
                CellView(data: self.listData.data[i], isLast: false, listData: listData)
            }
        }
    }
}

struct CellView: View {
    
    var data: Doc
    var isLast: Bool
    @ObservedObject var listData: GetData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(data.id)
                .fontWeight(.bold)
            
            Text(data.eissn)
            
            Text(data.article_type)
            
            if self.isLast {
                Text(data.publication_date)
                .font(.caption)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        if self.listData.data.count != 50 {
                            self.listData.updateData()
                        }
                    }
                }
            } else {
                Text(data.publication_date)
                .font(.caption)
            }
        }
        .padding()
    }
}



class GetData: ObservableObject {
    
    @Published var data = [Doc]()
    @Published var count = 1
    
    init() {
        updateData()
    }
    
    func updateData() {
        let urlString = "https://api.plos.org/search?q=title:%22Food%22&start=\(count)&rows=10"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            session.dataTask(with: url) { (data, _, err) in
                
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }
                
                do {
                    let json = try JSONDecoder().decode(DetailData.self, from: data!)
                    
                    let oldData = self.data
                    
                    DispatchQueue.main.async {
                        self.data = oldData + json.response.docs
                        self.count += 10
                    }
                    self.data = oldData + json.response.docs
                    
                } catch {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }
}

struct DetailData: Decodable {
    var response: Response
}

struct Response: Decodable {
    var docs: [Doc]
}

struct Doc: Decodable {
    var id: String
    var eissn: String
    var publication_date: String
    var article_type: String
}
