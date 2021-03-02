//
//  DishDetailView.swift
//  themaquereau
//
//  Created by david haioum on 02/03/2021.
//

import SwiftUI

struct DishDetailView: View {
    @State var dish: Item
    
    var body: some View {
        Text(dish.name_fr)
    }
}

struct DishDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let dish = Item(id: "", name_fr: "coucou", name_en: "", id_category: "", categ_name_fr: "", categ_name_en: "", images: [], ingredients: [], prices: [])
        DishDetailView(dish: dish)
    }
}
