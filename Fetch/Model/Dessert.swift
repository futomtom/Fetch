// Dessert.swift

import Foundation

struct Dessert: Codable, Identifiable, Comparable {
    let id: String
    let name: String
    let thumbnailURL: String
    var liked: Bool = false 

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnailURL = "strMealThumb"
    }

    static func < (lhs: Dessert, rhs: Dessert) -> Bool {
        lhs.name < rhs.name
    }
}

extension Dessert {
    static var mock = [
        Dessert(id: "1",
                name: "Abc",
                thumbnailURL: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    ]
}
