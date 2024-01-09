@testable import PolyToken

extension TokenizerModel {

    static func stub(languages: [Language] = [.english, .portuguese],
                     selectedLanguage: Language = .english,
                     textToTokenize: String? = nil) -> TokenizerModel {
        TokenizerModel(languages: languages,
                       selectedLanguage: selectedLanguage,
                       textToTokenize: textToTokenize)
    }
}
