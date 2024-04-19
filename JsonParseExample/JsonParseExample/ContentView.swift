//
//  ContentView.swift
//  JsonParseExample
//
//  Created by 김태성 on 4/19/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var getData = datas()
    
    var body: some View {
        NavigationView {
            List(getData.jsonData) { i in
                ListRow(url: i.avatar_url, name: i.login)
            }
            .navigationTitle("JSon Parsing")
        }
    }
}

class datas : ObservableObject {
    
    @Published var jsonData = [dataType]()
    
    init() {
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: "https://api.github.com/users/hadley/orgs")!) { (data, _, _) in
            do {
                let fetch = try JSONDecoder().decode([dataType].self, from: data!)
                
                DispatchQueue.main.async {
                    self.jsonData = fetch
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

// https://api.github.com/users/hadley/orgs
struct dataType: Identifiable, Decodable {
    var id: Int
    var login: String
    var node_id: String
    var avatar_url: String
    
}

struct ListRow: View {
    var url: String
    var name: String
    
    init(url: String, name: String) {
        self.url = url
        self.name = name
    }
    
    var body: some View {
        HStack {
            AnimatedImage(url: URL(string: url))
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .shadow(radius: 20)
            
            Text(name)
                .fontWeight(.heavy)
                .padding(.leading, 10)
        }
    }
}

#Preview {
    ContentView()
}
