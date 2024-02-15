// DessertDetail.swift

import Foundation

struct DessertDetail: Decodable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    let strInstructions: String

    private let strIngredient1: String?
    private let strIngredient2: String?
    private let strIngredient3: String?
    private let strIngredient4: String?
    private let strIngredient5: String?
    private let strIngredient6: String?
    private let strIngredient7: String?
    private let strIngredient8: String?
    private let strIngredient9: String?
    private let strIngredient10: String?
    private let strIngredient11: String?
    private let strIngredient12: String?
    private let strIngredient13: String?
    private let strIngredient14: String?
    private let strIngredient15: String?
    private let strIngredient16: String?
    private let strIngredient17: String?
    private let strIngredient18: String?
    private let strIngredient19: String?
    private let strIngredient20: String?
    private let strMeasure1: String?
    private let strMeasure2: String?
    private let strMeasure3: String?
    private let strMeasure4: String?
    private let strMeasure5: String?
    private let strMeasure6: String?
    private let strMeasure7: String?
    private let strMeasure8: String?
    private let strMeasure9: String?
    private let strMeasure10: String?
    private let strMeasure11: String?
    private let strMeasure12: String?
    private let strMeasure13: String?
    private let strMeasure14: String?
    private let strMeasure15: String?
    private let strMeasure16: String?
    private let strMeasure17: String?
    private let strMeasure18: String?
    private let strMeasure19: String?
    private let strMeasure20: String?

    var id: String {
        strMeal
    }

    var name: String {
        strMeal
    }

    var imageURL: URL? {
        URL(string: strMealThumb)
    }

    var ingredientsAndMeasurements: [Ingredient] {
        var result: [Ingredient] = []
        let mirror = Mirror(reflecting: self)

        for i in 1 ... 20 {
            let ingredient = mirror.children.first { $0.label == "strIngredient\(i)" }?.value as? String ?? ""
            let measure = mirror.children.first(where: { $0.label == "strMeasure\(i)" })?.value as? String ?? ""

            guard !ingredient.isEmpty else {
                continue
            }

            let newItem = Ingredient(ingredient: ingredient, measure: measure.isEmpty ? "N/A" : measure)
            if !result.contains(newItem) {
                result.append(newItem)
            }
        }

        return result
    }
}

extension DessertDetail {
    static let json = """
    {
        "idMeal": "53049",
        "strMeal": "Apam balik",
        "strDrinkAlternate": null,
        "strCategory": "Dessert",
        "strArea": "Malaysian",
        "strInstructions": "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\\r\\n\\r\\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\\r\\n\\r\\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\\r\\n\\r\\nCut into wedges and best eaten when it is warm.",
        "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
        "strTags": null,
        "strYoutube": "https://www.youtube.com/watch?v=6R8ffRRJcrg",
        "strIngredient1": "Milk",
        "strIngredient2": "Oil",
        "strIngredient3": "Eggs",
        "strIngredient4": "Flour",
        "strIngredient5": "Baking Powder",
        "strIngredient6": "Salt",
        "strIngredient7": "Unsalted Butter",
        "strIngredient8": "Sugar",
        "strIngredient9": "Peanut Butter",
        "strIngredient10": "",
        "strIngredient11": "",
        "strIngredient12": "",
        "strIngredient13": "",
        "strIngredient14": "",
        "strIngredient15": "",
        "strIngredient16": "",
        "strIngredient17": "",
        "strIngredient18": "",
        "strIngredient19": "",
        "strIngredient20": "",
        "strMeasure1": "200ml",
        "strMeasure2": "60ml",
        "strMeasure3": "2",
        "strMeasure4": "1600g",
        "strMeasure5": "3 tsp",
        "strMeasure6": "1/2 tsp",
        "strMeasure7": "25g",
        "strMeasure8": "45g",
        "strMeasure9": "3 tbs",
        "strMeasure10": " ",
        "strMeasure11": " ",
        "strMeasure12": " ",
        "strMeasure13": " ",
        "strMeasure14": " ",
        "strMeasure15": " ",
        "strMeasure16": " ",
        "strMeasure17": " ",
        "strMeasure18": " ",
        "strMeasure19": " ",
        "strMeasure20": " "
    }
    """

    static var mock: DessertDetail? {
        guard let jsonData = json.data(using: .utf8) else {
            return nil
        }

        return try? JSONDecoder().decode(DessertDetail.self, from: jsonData)
    }
}
