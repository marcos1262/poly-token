final class TokenizerPresenter {

    weak var controller: TokenizerViewControllerType?

    private let adapter: TokenizerAdapterType
    private var model: TokenizerModel {
        didSet {
            controller?.show(viewModel: adapter.adapt(from: model))
        }
    }

    init(adapter: TokenizerAdapterType) {
        self.adapter = adapter
        model = TokenizerModel(languages: [.english, .portuguese],
                               selectedLanguage: .english)
    }
}

extension TokenizerPresenter: TokenizerPresenterType {

    func didLoadView() {
        controller?.show(viewModel: adapter.adapt(from: model))
    }

    func didSelectLanguage(at index: Int) {
        guard let selectedLanguage = model.languages[safe: index] else { return }
        model.selectedLanguage = selectedLanguage
    }

    func didTapTokenize(with text: String) {
        model.textToTokenize = text
    }
}
