import UIKit

protocol TokenizerViewType where Self: UIView {
    var didSelectLanguage: ((_ index: Int) -> Void)? { get set }
    var didTapTokenize: ((_ text: String) -> Void)? { get set }

    func show(viewModel: TokenizerViewModel)
}

protocol TokenizerViewControllerType: AnyObject {
    func show(viewModel: TokenizerViewModel)
}

protocol TokenizerPresenterType {
    func didLoadView()
    func didSelectLanguage(at index: Int)
    func didTapTokenize(with text: String)
}

protocol TokenizerAdapterType {
    func adapt(from model: TokenizerModel) -> TokenizerViewModel
}
