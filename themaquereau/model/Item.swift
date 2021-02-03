//
//  Item.swift
//  themaquereau
//
//  Created by david haioum on 29/01/2021.
//

import Foundation

struct Item: Hashable, Codable {
    var id: String;
    var name_fr: String;
    var name_en: String;
    var id_category: String;
    var categ_name_fr: String;
    var categ_name_en: String;
    var images: [String];
    var ingredients: [Ingredient];
    var prices: [Price];
}
