import Foundation

enum LocalizedStrings {
    static let title = localized("title")
    static let english = localized("english")
    static let portuguese = localized("portuguese")
    static let enterText = localized("enterText")
    static let tokenize = localized("tokenize")
    static let result = localized("result")
}

extension LocalizedStrings {
    private static func localized(_ title: String) -> String {
        NSLocalizedString(title, comment: "")
    }
}
