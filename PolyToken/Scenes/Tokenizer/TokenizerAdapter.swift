struct TokenizerAdapter {

    private func getLanguages(from model: TokenizerModel) -> [String] {
        model.languages.map { $0.title }
    }

    private func getSelectedLanguageIndex(from model: TokenizerModel) -> Int {
        model.languages.firstIndex(of: model.selectedLanguage) ?? 0
    }

    private func getTokenizedResult(from model: TokenizerModel) -> String? {
        guard let textToTokenize = model.textToTokenize,
              !textToTokenize.isEmpty else { return nil }

        var result = [String]()
        let words = textToTokenize.split(separator: " ")

        for word in words {
            if model.selectedLanguage.tokens.contains(where: { $0 == word.lowercased() }) {
                result.append("\n- " + word.capitalized)
            } else {
                result.append(String(word))
            }
        }

        return "- " + result.joined(separator: " ")
    }
}

extension TokenizerAdapter: TokenizerAdapterType {

    func adapt(from model: TokenizerModel) -> TokenizerViewModel {
        TokenizerViewModel(languages: getLanguages(from: model),
                           selectedLanguageIndex: getSelectedLanguageIndex(from: model),
                           tokenizedResult: getTokenizedResult(from: model))
    }
}
