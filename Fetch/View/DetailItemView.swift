// DetailItemView.swift

import SwiftUI

struct DetailItemView: View {
    var detail: DessertDetail

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text(detail.strMeal)
                    .headerStyling()


                AsyncImage(url: detail.imageURL, transaction: .init(animation: .easeInOut)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .transition(.scale)
                    } else {
                        ProgressView()
                    }
                }
                .frame(minHeight: 50)
                .onTapGesture {
                    
                }

                Text("Instructions:")
                    .headerStyling()
                Text(detail.strInstructions)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)

                Text("Measurements:")
                    .headerStyling()

                ForEach(detail.ingredientsAndMeasurements, id: \.self) { item in
                    HStack {
                        Text(item.ingredient)
                        Spacer()
                        Text(item.measure)
                    }
                }
            }
        }
    }
}

#Preview {
    DetailItemView(detail: DessertDetail.mock!)
        .padding(.horizontal)
}
