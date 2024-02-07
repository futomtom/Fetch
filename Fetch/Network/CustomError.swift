import Foundation

public enum CustomError: LocalizedError {
    case invalidServerResponse
    case invalidMealId
    case invalidURL

    public var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            "The server returned an invalid response."
        case .invalidURL:
            "URL string is malformed."
        case .invalidMealId:
            "invalid MealId"
        }
    }
}
