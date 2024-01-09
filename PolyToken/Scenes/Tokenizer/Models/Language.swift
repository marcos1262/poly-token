enum Language: Equatable {
    case english
    case portuguese

    var title: String {
        switch self {
        case .english:
            return LocalizedStrings.english
        case .portuguese:
            return LocalizedStrings.portuguese
        }
    }

    var tokens: [String] {
        switch self {
        case .english:
            return ["and", "if"]
        case .portuguese:
            return ["e", "se"]
        }
    }
}
