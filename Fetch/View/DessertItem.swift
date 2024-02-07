//
//  DessertItem.swift

import SwiftUI

struct DessertItem: View {
    var dessert: Dessert

    var body: some View {
        HStack(spacing: 8) {
            AsyncImage(url: URL(string: dessert.thumbnailURL)!) { phase in
                if let image = phase.image {
                    image.resizable()
                }
            }
            .frame(width: 100, height: 100)
            Text(dessert.name)
        }
    }
}

#Preview {
    DessertItem(dessert: Dessert.mock.first!)
}
