import UIKit

@testable import PolyToken

final class TokenizerViewSpy: UIView, TokenizerViewType {

    var didSelectLanguage: ((_ index: Int) -> Void)?
    var didTapTokenize: ((_ text: String) -> Void)?

    private(set) var showParameters = [TokenizerViewModel]()

    func show(viewModel: TokenizerViewModel) {
        showParameters.append(viewModel)
    }
}
