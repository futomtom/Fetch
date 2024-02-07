// ContentView.swift

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ListViewModel()

    var body: some View {
        NavigationStack {
            DessertsList(desserts: viewModel.desserts)
                .navigationTitle("Desserts")
                .navigationBarTitleDisplayMode(.inline)
                .overlay {
                    if viewModel.loadingStatus == .loading {
                        ProgressView()
                    }
                }
        }
        .task {
            do {
                try await viewModel.fetch()
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    ContentView(viewModel: ListViewModel(client: MockClient()))
}
