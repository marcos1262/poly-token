struct TokenizerModel: Equatable {
    var languages: [Language]
    var selectedLanguage: Language
    var textToTokenize: String?
}
