import Foundation
import UIKit

struct MenuData: Codable {
    let meals: [Menu]
}

struct Menu: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case label = "strArea"
        case image = "strMealThumb"
    }
    
    var name: String
    var label: String
    var image: String
    
    init(from menuData: MenuData) {
        self.name = menuData.meals.first?.name ?? ""
        self.label = menuData.meals.first?.label ?? ""
        self.image = menuData.meals.first?.image ?? ""
    }
}
