@testable import PolyToken

final class TokenizerPresenterSpy: TokenizerPresenterType {

    private(set) var didLoadViewCallCount = 0
    private(set) var didSelectLanguageParameters = [Int]()
    private(set) var didTapTokenizeParameters = [String]()

    func didLoadView() {
        didLoadViewCallCount += 1
    }

    func didSelectLanguage(at index: Int) {
        didSelectLanguageParameters.append(index)
    }

    func didTapTokenize(with text: String) {
        didTapTokenizeParameters.append(text)
    }
}
