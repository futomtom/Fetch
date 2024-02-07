//
//  ListViewModel.swift

import Combine
import SwiftUI

final class ListViewModel: ObservableObject {
    @Published var loadingStatus: LoadingStatus = .loading
    @Published var desserts: [Dessert] = []

    let client: ClientProtocol

    init(client: ClientProtocol = NetClient()) {
        self.client = client
    }

    func fetch() async throws {
        do {
            let response: DesertResponse = try await client.fetch(endPoint: .dessert)
            await MainActor.run {
                loadingStatus = .idle
                desserts = response.desserts
            }
        } catch {
            print(error)
            await MainActor.run {
                loadingStatus = .error
            }
        }
    }
}

extension ListViewModel {
    enum LoadingStatus: Equatable {
        case loading
        case idle
        case error
    }
}
