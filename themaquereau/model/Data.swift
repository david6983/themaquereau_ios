//
// Created by david haioum on 29/01/2021.
//

import Foundation

struct Data : Hashable, Codable {
    var name_fr: String;
    var name_en: String;
    var items: [Item];
}
