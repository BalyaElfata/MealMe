import Foundation

class MenuRepository {
    private let networkService: NetworkService
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = NetworkService()
    }
    
    func fetchMenu() async throws -> Menu {
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken"
        let data = try await networkService.fetchData(from: urlString)
        
        let response = try JSONDecoder().decode(MenuResponse.self, from: data)
        
        guard let menu = response.meals.first else {
            throw MenuError.notFound
        }
        
        return menu
    }
    
    enum MenuError: Error {
        case notFound
    }
}
