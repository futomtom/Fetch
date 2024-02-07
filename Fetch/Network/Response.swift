// Response.swift

import Foundation

struct DesertResponse: Decodable {
    var desserts: [Dessert]
    enum CodingKeys: String, CodingKey {
        case desserts = "meals"
    }
}

struct DetailResponse: Decodable {
    var desertDetail: [DessertDetail]
    enum CodingKeys: String, CodingKey {
        case desertDetail = "meals"
    }
}
