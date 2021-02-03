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
            VStack(alignment: .center) {
                ZStack {
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 400)
                        .colorMultiply(.gray)
                    Image("title_white")
                        .padding(.top, 100)
                }
                VStack(alignment: .center, spacing: 0) {
                    NavigationLink(
                        destination: DishListView(category: 0, dishes: [])
                    ) {
                        Text("Entrées")
                            .padding()
                            .font(.title2)
                            .foregroundColor(Color.init("main"))
                    }
                    .padding()
                    NavigationLink(
                        destination: DishListView(category: 1, dishes: [])
                    ) {
                        Text("Plats")
                            .padding()
                            .font(.title2)
                            .foregroundColor(Color.init("main"))
                    }
                    .padding()
                    NavigationLink(
                        destination: DishListView(category: 2, dishes: [])
                    ) {
                        Text("Desserts")
                            .padding()
                            .font(.title2)
                            .foregroundColor(Color.init("main"))
                    }
                    .padding()
                    NavigationLink(
                        destination: ContactView()
                    ) {
                        Text("Nous Contacter")
                            .padding()
                            .font(.title2)
                            .foregroundColor(Color.blue)
                    }
                    .padding()
                }
                .padding(.bottom, 30)
                .padding(.top, 30)
                Image("michelin")
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .center)
                    .scaledToFit()
            }
            .padding(.bottom, 200)
        }
        .navigationTitle("")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
