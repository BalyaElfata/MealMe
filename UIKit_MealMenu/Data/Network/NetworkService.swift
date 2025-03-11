import Foundation

class NetworkService {
    func fetchData(from urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            throw NetworkError.invalidResponse
        }

        return data
    }
}

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
