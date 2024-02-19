import Foundation

protocol ClientProtocol {
    func fetch<T: Decodable>(endPoint: EndPoint) async throws -> T
}

struct NetClient: ClientProtocol {
    let base = "https://themealdb.com"

    @discardableResult
    func fetch<T: Decodable>(endPoint: EndPoint) async throws -> T {
        guard let url = URL(string: base + endPoint.path) else {
            throw CustomError.invalidURL
        }

        let response: T = try await get(from: url)
        return response
    }
}

extension NetClient {
    private func get<T: Decodable>(from url: URL) async throws -> T {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw CustomError.invalidServerResponse
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            let result: T = try decoder.decode(T.self, from: data)
            return result
        } catch {
            throw error
        }
    }
}
