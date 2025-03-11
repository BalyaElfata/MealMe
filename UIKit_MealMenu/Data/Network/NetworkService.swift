import Foundation

class NetworkService {
    private let url = "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken"

    func getMenus() async throws -> MenuData {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            throw NetworkError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(MenuData.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
