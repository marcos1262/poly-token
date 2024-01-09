@testable import PolyToken

final class TokenizerAdapterSpy: TokenizerAdapterType {

    private(set) var adaptParameters = [TokenizerModel]()

    func adapt(from model: TokenizerModel) -> TokenizerViewModel {
        adaptParameters.append(model)
        return .stub()
    }
}
