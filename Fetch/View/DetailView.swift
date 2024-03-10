//
//  DetailView.swift

import SwiftUI

struct DetailView: View {
    let dessert: Dessert
    @ObservedObject var viewModel: DetailViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            if let detail = viewModel.detail {
                DetailItemView(detail: detail)
                    .padding(.horizontal)
            }
        }
        .navigationTitle(dessert.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    presentationMode.wrappedValue.dismiss()

                } label: {
                    Text("Done")
                }
            }
        }
        .task {
            do {
                try await viewModel.fetch(id: dessert.id)
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    DetailView(dessert: Dessert.mock.first!, viewModel: DetailViewModel(client: MockClient()))
}
