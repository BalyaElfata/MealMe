import Foundation

struct MenuResponse: Codable {
    let meals: [Menu]
}

struct Menu: Codable {
    let name: String
    let label: String
    let image: String
    let instructions: String
    let youtubeLink: String
    var ingredients: [Ingredient]
    
    struct Ingredient: Codable {
        let name: String
        let measure: String
        
        init(name: String, measure: String) {
            self.name = name
            self.measure = measure
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case label = "strArea"
        case image = "strMealThumb"
        case instructions = "strInstructions"
        case youtubeLink = "strYoutube"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode the standard fields
        name = try container.decode(String.self, forKey: .name)
        label = try container.decode(String.self, forKey: .label)
        image = try container.decode(String.self, forKey: .image)
        instructions = try container.decode(String.self, forKey: .instructions)
        youtubeLink = try container.decode(String.self, forKey: .youtubeLink)
        
        // Now handle the dynamic ingredient fields
        ingredients = []
        
        // Create a container with dynamic keys
        let dynamicContainer = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
        // Process ingredient and measure pairs (up to 20)
        for idx in 1...20 {
            let ingredientKey = DynamicCodingKeys(stringValue: "strIngredient\(idx)")!
            let measureKey = DynamicCodingKeys(stringValue: "strMeasure\(idx)")!
            
            if let ingredientName = try? dynamicContainer.decode(String.self, forKey: ingredientKey),
               let measure = try? dynamicContainer.decode(String.self, forKey: measureKey) {
                
                // Clean and validate the ingredient
                let cleanIngredient = ingredientName.trimmingCharacters(in: .whitespacesAndNewlines)
                let cleanMeasure = measure.trimmingCharacters(in: .whitespacesAndNewlines)
                
                // Only add non-empty ingredients
                if !cleanIngredient.isEmpty {
                    ingredients.append(Ingredient(name: cleanIngredient, measure: cleanMeasure))
                }
            }
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(label, forKey: .label)
        try container.encode(image, forKey: .image)
        try container.encode(instructions, forKey: .instructions)
        try container.encode(youtubeLink, forKey: .youtubeLink)
        
        // Handle dynamic encoding of ingredients if needed
        var dynamicContainer = encoder.container(keyedBy: DynamicCodingKeys.self)
        
        for (index, ingredient) in ingredients.enumerated() {
            let idx = index + 1
            if idx > 20 { break } // Limit to 20 ingredients
            
            let ingredientKey = DynamicCodingKeys(stringValue: "strIngredient\(idx)")!
            let measureKey = DynamicCodingKeys(stringValue: "strMeasure\(idx)")!
            
            try dynamicContainer.encode(ingredient.name, forKey: ingredientKey)
            try dynamicContainer.encode(ingredient.measure, forKey: measureKey)
        }
    }
}

// A custom CodingKey implementation for dynamic keys
struct DynamicCodingKeys: CodingKey {
    var stringValue: String
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }
    
    init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
}
