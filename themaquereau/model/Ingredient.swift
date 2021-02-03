//
//  Ingredient.swift
//  themaquereau
//
//  Created by david haioum on 29/01/2021.
//

import Foundation

struct Ingredient: Hashable, Codable {
    var id: String;
    var id_shop: String;
    var name_fr: String;
    var create_date: Date;
    var update_date: Date;
    var id_pizza: String;
}
