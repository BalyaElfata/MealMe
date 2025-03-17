import Foundation

class MenuRepository {
    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    private let mockCookingTimes: [String: Int] = [
        "Chicken Handi": 20,
        "Chicken Congee": 35,
        "Chicken Karaage": 60,
        "Chicken Marengo": 40,
        "Tandoori chicken": 80,
        "Chicken Couscous": 15,
        "Kung Pao Chicken": 30,
        "Chicken Basquaise": 70,
        "Chicken Parmentier": 45,
        "Brown Stew Chicken": 30,
        "Katsu Chicken curry": 45,
        "Nutty Chicken Curry": 15,
        "General Tsos Chicken": 10,
        "Kentucky Fried Chicken": 20,
        "Chicken Ham and Leek Pie": 55,
        "Chicken Alfredo Primavera": 35,
        "Chicken & mushroom Hotpot": 45,
        "Teriyaki Chicken Casserole": 55,
        "Potato Gratin with Chicken": 15,
        "Piri-piri chicken and slaw": 100,
        "Chicken Quinoa Greek Salad": 15,
        "Chicken Enchilada Casserole": 50,
        "Rosol": 120,
        "Chicken Fajita Mac and Cheese": 20,
        "Crock Pot Chicken Baked Tacos": 250
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
