import Foundation

//struct Menu {
//    let name: String
//    let label: String
//    let image: String
//    let instructions: String
//    let youtubeLink: String
//    let ingredients: [String]
//    let measures: [String]
//}

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
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
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
    var ingredient5: String
    var ingredient6: String
    var ingredient7: String
    var ingredient8: String
    var ingredient9: String
    var ingredient10: String
    var ingredient11: String
    var ingredient12: String
    var ingredient13: String
    var ingredient14: String
    var ingredient15: String
    var ingredient16: String
    var ingredient17: String
    var ingredient18: String
    var ingredient19: String
    var ingredient20: String
    
    var measure1: String
    var measure2: String
    var measure3: String
    var measure4: String
    var measure5: String
    var measure6: String
    var measure7: String
    var measure8: String
    var measure9: String
    var measure10: String
    var measure11: String
    var measure12: String
    var measure13: String
    var measure14: String
    var measure15: String
    var measure16: String
    var measure17: String
    var measure18: String
    var measure19: String
    var measure20: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        func clean(_ value: String?) -> String {
            return value?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        }
        
        name = clean(try container.decodeIfPresent(String.self, forKey: .name))
        label = clean(try container.decodeIfPresent(String.self, forKey: .label))
        image = clean(try container.decodeIfPresent(String.self, forKey: .image))
        instructions = clean(try container.decodeIfPresent(String.self, forKey: .instructions))
        youtubeLink = clean(try container.decodeIfPresent(String.self, forKey: .youtubeLink))
        
        ingredient1 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient1))
        ingredient2 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient2))
        ingredient3 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient3))
        ingredient4 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient4))
        ingredient5 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient5))
        ingredient6 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient6))
        ingredient7 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient7))
        ingredient8 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient8))
        ingredient9 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient9))
        ingredient10 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient10))
        ingredient11 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient11))
        ingredient12 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient12))
        ingredient13 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient13))
        ingredient14 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient14))
        ingredient15 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient15))
        ingredient16 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient16))
        ingredient17 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient17))
        ingredient18 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient18))
        ingredient19 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient19))
        ingredient20 = clean(try container.decodeIfPresent(String.self, forKey: .ingredient20))
        
        measure1 = clean(try container.decodeIfPresent(String.self, forKey: .measure1))
        measure2 = clean(try container.decodeIfPresent(String.self, forKey: .measure2))
        measure3 = clean(try container.decodeIfPresent(String.self, forKey: .measure3))
        measure4 = clean(try container.decodeIfPresent(String.self, forKey: .measure4))
        measure5 = clean(try container.decodeIfPresent(String.self, forKey: .measure5))
        measure6 = clean(try container.decodeIfPresent(String.self, forKey: .measure6))
        measure7 = clean(try container.decodeIfPresent(String.self, forKey: .measure7))
        measure8 = clean(try container.decodeIfPresent(String.self, forKey: .measure8))
        measure9 = clean(try container.decodeIfPresent(String.self, forKey: .measure9))
        measure10 = clean(try container.decodeIfPresent(String.self, forKey: .measure10))
        measure11 = clean(try container.decodeIfPresent(String.self, forKey: .measure11))
        measure12 = clean(try container.decodeIfPresent(String.self, forKey: .measure12))
        measure13 = clean(try container.decodeIfPresent(String.self, forKey: .measure13))
        measure14 = clean(try container.decodeIfPresent(String.self, forKey: .measure14))
        measure15 = clean(try container.decodeIfPresent(String.self, forKey: .measure15))
        measure16 = clean(try container.decodeIfPresent(String.self, forKey: .measure16))
        measure17 = clean(try container.decodeIfPresent(String.self, forKey: .measure17))
        measure18 = clean(try container.decodeIfPresent(String.self, forKey: .measure18))
        measure19 = clean(try container.decodeIfPresent(String.self, forKey: .measure19))
        measure20 = clean(try container.decodeIfPresent(String.self, forKey: .measure20))
    }
}
