//
// Created by david haioum on 29/01/2021.
//

import Foundation

struct Price : Hashable, Codable {
    var id: String;
    var id_pizza: String;
    var id_size: String;
    var price: String;
    var create_date: Date;
    var update_date: Date;
    var size: String;
}
