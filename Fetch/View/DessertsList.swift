//  DessertsList.swift

import SwiftUI

struct DessertsList: View {
    var desserts: [Dessert]

    var body: some View {
        List(desserts) { dessert in
            NavigationLink {
                DetailView(dessert: dessert, viewModel: DetailViewModel())
            } label: {
                DessertItem(dessert: dessert)
            }
        }
    }
}

#Preview {
    DessertsList(desserts: Dessert.mock)
}
