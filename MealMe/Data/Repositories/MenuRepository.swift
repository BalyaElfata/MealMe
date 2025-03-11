import Foundation

class MenuRepository {
    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    private let mockCookingTimes: [String: Int] = [
        "Chicken": 30,
        "Roasted Chicken": 90,
        "Chicken Curry": 45,
        "Chicken Parmesan": 40,
        "Fried Chicken": 35,
        "Grilled Chicken": 25,
        "Chicken Alfredo": 30,
        "Chicken Stir-fry": 20,
        "Chicken Cacciatore": 60,
        "Chicken Marsala": 35,
        "Chicken Soup": 50,
        "Teriyaki Chicken": 25,
        "BBQ Chicken": 45,
        "Butter Chicken": 40,
        "Chicken Piccata": 30,
        "Chicken Fajitas": 25,
        "Chicken Enchiladas": 50,
        "Coq au Vin": 90,
        "Chicken Biryani": 60,
        "Buffalo Chicken": 25,
        
        "Pasta": 25,
        "Soup": 40,
        "Stew": 90,
        "Roast": 120,
        "Salad": 15,
        "Pizza": 30,
        "Sandwich": 10,
        "Burger": 20,
        "Fish": 25,
        "Steak": 20,
        "Dessert": 45,
        "Breakfast": 20
    ]
    
    private func determineCookingTime(for menu: Menu) -> Int {
        let name = menu.name
        
        for (dishPattern, time) in mockCookingTimes where name.contains(dishPattern) {
                return time
        }
        
        return 30
    }
    
    func fetchAllMenus() async throws -> [Menu] {
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken"
        
        let data = try await networkService.fetchData(from: urlString)
        let response = try JSONDecoder().decode(MenuResponse.self, from: data)
        
        var menus = response.meals
        
        for idx in 0..<menus.count {
            menus[idx].cookingTime = determineCookingTime(for: menus[idx])
        }
        
        return menus
    }
    
    enum MenuError: Error {
        case notFound
    }
}
