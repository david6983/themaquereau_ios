//
//  DishListView.swift
//  themaquereau
//
//  Created by david haioum on 29/01/2021.
//

import SwiftUI

struct DishListView: View {
    @State var category: Int
    @State var dishes: [Item]
        
    var body: some View {
        NavigationView {
            List {
                ForEach(dishes, id: \.self) { dish in
                    Text(dish.name_fr)
                        .padding()
                }
            }
        }.onAppear {
            getJson()
        }
    }
    
    func getJson() {
        let api_url = "http://test.api.catering.bluecodegames.com/menu"
        let api_data: [String: Any] = ["id_shop": "1"]
        
        if let url = URL(string: api_url) {
            var req = URLRequest(url: url)
            req.addValue("content-type", forHTTPHeaderField: "application/json")
            req.httpMethod = "POST"
            let jsonData = try? JSONSerialization.data(withJSONObject: api_data)
            req.httpBody = jsonData
            
            URLSession.shared.dataTask(with: req) { data, res, err in
                if let data = data {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    do {
                        let json = try decoder.decode(JsonDataResponse.self, from: data)
                        dishes = json.data[0].items
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
}

struct DishListView_Previews: PreviewProvider {
    static var previews: some View {
        DishListView(category: 0, dishes: [])
    }
}
