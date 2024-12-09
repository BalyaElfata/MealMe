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
        case instructions = "strInstructions"
        case youtubeLink = "strYoutube"
        
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
//        case ingredient5 = "strIngredient5"
//        case ingredient6 = "strIngredient6"
//        case ingredient7 = "strIngredient7"
//        case ingredient8 = "strIngredient8"
//        case ingredient9 = "strIngredient9"
//        case ingredient10 = "strIngredient10"
//        case ingredient11 = "strIngredient11"
//        case ingredient12 = "strIngredient12"
//        case ingredient13 = "strIngredient13"
//        case ingredient14 = "strIngredient14"
//        case ingredient15 = "strIngredient15"
//        case ingredient16 = "strIngredient16"
//        case ingredient17 = "strIngredient17"
//        case ingredient18 = "strIngredient18"
//        case ingredient19 = "strIngredient19"
//        case ingredient20 = "strIngredient20"
        
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
//        case measure5 = "strMeasure5"
//        case measure6 = "strMeasure6"
//        case measure7 = "strMeasure7"
//        case measure8 = "strMeasure8"
//        case measure9 = "strMeasure9"
//        case measure10 = "strMeasure10"
//        case measure11 = "strMeasure11"
//        case measure12 = "strMeasure12"
//        case measure13 = "strMeasure13"
//        case measure14 = "strMeasure14"
//        case measure15 = "strMeasure15"
//        case measure16 = "strMeasure16"
//        case measure17 = "strMeasure17"
//        case measure18 = "strMeasure18"
//        case measure19 = "strMeasure19"
//        case measure20 = "strMeasure20"
    }
    
    var name: String
    var label: String
    var image: String
    var instructions: String
    var youtubeLink: String
    
    var ingredient1: String
    var ingredient2: String
    var ingredient3: String
    var ingredient4: String
//    var ingredient5: String
//    var ingredient6: String
//    var ingredient7: String
//    var ingredient8: String
//    var ingredient9: String
//    var ingredient10: String
//    var ingredient11: String
//    var ingredient12: String
//    var ingredient13: String
//    var ingredient14: String
//    var ingredient15: String
//    var ingredient16: String
//    var ingredient17: String
//    var ingredient18: String
//    var ingredient19: String
//    var ingredient20: String
    
    var measure1: String
    var measure2: String
    var measure3: String
    var measure4: String
//    var measure5: String
//    var measure6: String
//    var measure7: String
//    var measure8: String
//    var measure9: String
//    var measure10: String
//    var measure11: String
//    var measure12: String
//    var measure13: String
//    var measure14: String
//    var measure15: String
//    var measure16: String
//    var measure17: String
//    var measure18: String
//    var measure19: String
//    var measure20: String
    
    init(from menuData: MenuData) {
        self.name = menuData.meals.first?.name ?? ""
        self.label = menuData.meals.first?.label ?? ""
        self.image = menuData.meals.first?.image ?? ""
        self.instructions = menuData.meals.first?.instructions ?? ""
        self.youtubeLink = menuData.meals.first?.youtubeLink ?? ""
        
        self.ingredient1 = menuData.meals.first?.ingredient1 ?? ""
        self.ingredient2 = menuData.meals.first?.ingredient2 ?? ""
        self.ingredient3 = menuData.meals.first?.ingredient3 ?? ""
        self.ingredient4 = menuData.meals.first?.ingredient4 ?? ""
//        self.ingredient5 = menuData.meals.first?.ingredient5 ?? ""
//        self.ingredient6 = menuData.meals.first?.ingredient6 ?? ""
//        self.ingredient7 = menuData.meals.first?.ingredient7 ?? ""
//        self.ingredient8 = menuData.meals.first?.ingredient8 ?? ""
//        self.ingredient9 = menuData.meals.first?.ingredient9 ?? ""
//        self.ingredient10 = menuData.meals.first?.ingredient10 ?? ""
//        self.ingredient11 = menuData.meals.first?.ingredient11 ?? ""
//        self.ingredient12 = menuData.meals.first?.ingredient12 ?? ""
//        self.ingredient13 = menuData.meals.first?.ingredient13 ?? ""
//        self.ingredient14 = menuData.meals.first?.ingredient14 ?? ""
//        self.ingredient15 = menuData.meals.first?.ingredient15 ?? ""
//        self.ingredient16 = menuData.meals.first?.ingredient16 ?? ""
//        self.ingredient17 = menuData.meals.first?.ingredient17 ?? ""
//        self.ingredient18 = menuData.meals.first?.ingredient18 ?? ""
//        self.ingredient19 = menuData.meals.first?.ingredient19 ?? ""
//        self.ingredient20 = menuData.meals.first?.ingredient20 ?? ""
        
        self.measure1 = menuData.meals.first?.measure1 ?? ""
        self.measure2 = menuData.meals.first?.measure2 ?? ""
        self.measure3 = menuData.meals.first?.measure3 ?? ""
        self.measure4 = menuData.meals.first?.measure4 ?? ""
//        self.measure5 = menuData.meals.first?.measure5 ?? ""
//        self.measure6 = menuData.meals.first?.measure6 ?? ""
//        self.measure7 = menuData.meals.first?.measure7 ?? ""
//        self.measure8 = menuData.meals.first?.measure8 ?? ""
//        self.measure9 = menuData.meals.first?.measure9 ?? ""
//        self.measure10 = menuData.meals.first?.measure10 ?? ""
//        self.measure11 = menuData.meals.first?.measure11 ?? ""
//        self.measure12 = menuData.meals.first?.measure12 ?? ""
//        self.measure13 = menuData.meals.first?.measure13 ?? ""
//        self.measure14 = menuData.meals.first?.measure14 ?? ""
//        self.measure15 = menuData.meals.first?.measure15 ?? ""
//        self.measure16 = menuData.meals.first?.measure16 ?? ""
//        self.measure17 = menuData.meals.first?.measure17 ?? ""
//        self.measure18 = menuData.meals.first?.measure18 ?? ""
//        self.measure19 = menuData.meals.first?.measure19 ?? ""
//        self.measure20 = menuData.meals.first?.measure20 ?? ""
    }
}
