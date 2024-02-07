// DetailViewModel.swift

import Foundation
import SwiftUI

final class DetailViewModel: ObservableObject {
    @Published var detail: DessertDetail?

    let client: ClientProtocol

    init(client: ClientProtocol = NetClient()) {
        self.client = client
    }

    func fetch(id: String) async throws {
        do {
            let response: DetailResponse = try await client.fetch(endPoint: .detail(id))
            await MainActor.run {
                detail = response.desertDetail.first
            }
        } catch {
            let _ = print("🙂", error)
        }
    }
}
