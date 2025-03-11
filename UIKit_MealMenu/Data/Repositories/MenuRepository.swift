import Foundation

protocol MenuRepository {
    func fetchMenus(for id: String, completion: @escaping (Menu?) -> Void) async throws
}

class DefaultMenuRepository: MenuRepository {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchMenus(for id: String, completion: @escaping (Menu?) -> Void) async throws {
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Network error: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(MenuData.self, from: data)
                if let firstMeal = response.meals.first {
                    completion(firstMeal)
                } else {
                    completion(nil)
                }
            } catch {
                print("Decoding error: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
