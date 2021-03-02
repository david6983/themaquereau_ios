//
//  DishListView.swift
//  themaquereau
//
//  Created by david haioum on 29/01/2021.
//

import SwiftUI
import URLImage

struct DishListView: View {
    @State var category: Int
    @State var title: String
    @State var dishes: [Item]
        
    var body: some View {
        NavigationView {
            List {
                ForEach(dishes, id: \.self) { dish in
                    NavigationLink(
                        destination: DishDetailView(dish: dish)
                    ) {
                        HStack {
                            HStack {
                                Text(dish.name_fr)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .padding(.bottom, 70)
                            }
                            Spacer()
                            if dish.images.indices.contains(0) && !dish.images[0].isEmpty {
                                let imageUrl = URL(string: dish.images[0])
                                URLImage(url: imageUrl!,
                                 content: { image in
                                    image
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                 })
                            } else {
                                Image("maquereau_not_found")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle(title)
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
                        dishes = json.data[category].items
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
        DishListView(category: 2, title: "My Super duper title", dishes: [])
    }
}
