//
//  ContentView.swift
//  themaquereau
//
//  Created by david haioum on 26/01/2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 85) {
                Image("Themaquereau")
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .center, spacing: 25) {
                    NavigationLink(
                        destination: DishListView(category: 0, dishes: [])
                    ) {
                        Text("Entrées")
                            .padding()
                            .font(.title3)
                            .foregroundColor(Color.init("main"))
                    }
                    NavigationLink(
                        destination: DishListView(category: 1, dishes: [])
                    ) {
                        Text("Plats")
                            .padding()
                            .font(.title3)
                            .cornerRadius(15)
                            .foregroundColor(Color.init("main"))
                    }
                    NavigationLink(
                        destination: DishListView(category: 2, dishes: [])
                    ) {
                        Text("Desserts")
                            .padding()
                            .font(.title3)
                            .cornerRadius(15)
                            .foregroundColor(Color.init("main"))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
