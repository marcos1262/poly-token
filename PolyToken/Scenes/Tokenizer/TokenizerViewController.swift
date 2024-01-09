import UIKit

final class TokenizerViewController: UIViewController {

    private let presenter: TokenizerPresenterType
    private let contentView: TokenizerViewType

    init(presenter: TokenizerPresenterType,
         contentView: TokenizerViewType = TokenizerView()) {
        self.presenter = presenter
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = LocalizedStrings.title
        bindLayoutEvents()
        presenter.didLoadView()
    }

    private func bindLayoutEvents() {
        contentView.didSelectLanguage = { [weak self] index in
            self?.presenter.didSelectLanguage(at: index)
        }
        contentView.didTapTokenize = { [weak self] text in
            self?.presenter.didTapTokenize(with: text)
        }
    }
}

extension TokenizerViewController: TokenizerViewControllerType {

    func show(viewModel: TokenizerViewModel) {
        contentView.show(viewModel: viewModel)
    }
}
