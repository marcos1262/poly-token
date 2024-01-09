@testable import PolyToken

final class TokenizerViewControllerSpy: TokenizerViewControllerType {

    private(set) var showParameters = [TokenizerViewModel]()

    func show(viewModel: TokenizerViewModel) {
        showParameters.append(viewModel)
    }
}
