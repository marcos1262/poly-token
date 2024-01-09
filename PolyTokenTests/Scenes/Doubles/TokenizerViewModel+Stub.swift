@testable import PolyToken

extension TokenizerViewModel {

    static func stub(languages: [String] = ["English", "Portuguese"],
                     selectedLanguageIndex: Int = 0,
                     tokenizedResult: String? = nil) -> TokenizerViewModel {
        TokenizerViewModel(languages: languages,
                           selectedLanguageIndex: selectedLanguageIndex,
                           tokenizedResult: tokenizedResult)
    }
}
