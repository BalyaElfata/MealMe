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
        case ingredients = "strIngredient1"
        case instructions = "strInstructions"
        case youtubeLink = "strYoutube"
    }
    
    var name: String
    var label: String
    var image: String
    var ingredients: String
    var instructions: String
    var youtubeLink: String
    
    init(from menuData: MenuData) {
        self.name = menuData.meals.first?.name ?? ""
        self.label = menuData.meals.first?.label ?? ""
        self.image = menuData.meals.first?.image ?? ""
        self.ingredients = menuData.meals.first?.ingredients ?? ""
        self.instructions = menuData.meals.first?.instructions ?? ""
        self.youtubeLink = menuData.meals.first?.youtubeLink ?? ""
    }
}
