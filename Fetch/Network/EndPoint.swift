// EndPoint.swift

import Foundation

enum EndPoint {
    case dessert
    case detail(String)

    var path: String {
        switch self {
        case .dessert:
            "/api/json/v1/1/filter.php?c=Dessert"
        case let .detail(mealId):
            "/api/json/v1/1/lookup.php?i=\(mealId)"
        }
    }
}
