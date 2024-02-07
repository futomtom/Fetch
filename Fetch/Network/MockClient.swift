// MockClient.swift

import Foundation

struct MockClient: ClientProtocol {
    func fetch<T: Decodable>(endPoint: EndPoint) async throws -> T {
        guard let path = getJSONPath(endPoint) else {
            throw CustomError.invalidServerResponse
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let response = try JSONDecoder().decode(T.self, from: data)
            return response
        } catch {
            print("🙂", error)
            throw CustomError.invalidServerResponse
        }
    }

    private func getJSONPath(_ endPoint: EndPoint) -> String? {
        switch endPoint {
        case .dessert:
            Bundle.main.path(forResource: "dessert", ofType: "json")
        case .detail:
            Bundle.main.path(forResource: "detail", ofType: "json")
        }
    }
}
