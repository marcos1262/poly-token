import UIKit

final class TokenizerView: UIScrollView {

    var didSelectLanguage: ((_ index: Int) -> Void)?
    var didTapTokenize: ((_ text: String) -> Void)?

    private let languagesSegmentedControl: UISegmentedControl = {
        let view = UISegmentedControl()
        view.selectedSegmentTintColor = .systemIndigo
        view.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.white
        ], for: .selected)
        return view
    }()

    private let tokenizeTitle: UILabel = {
        let view = UILabel()
        view.text = LocalizedStrings.enterText
        return view
    }()

    private let tokenizeTextView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .systemFill
        view.layer.cornerRadius = 8
        view.font = .systemFont(ofSize: UIFont.labelFontSize)
        return view
    }()

    private let tokenizeButton: UIButton = {
        let view = UIButton(type: .custom)
        view.layer.cornerRadius = 8
        view.setTitle(LocalizedStrings.tokenize, for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .systemIndigo
        return view
    }()

    private let resultTitle: UILabel = {
        let view = UILabel()
        view.text = LocalizedStrings.result
        view.font = .boldSystemFont(ofSize: 24)
        return view
    }()

    private let resultLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        return view
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = Spacing.medium
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .systemBackground
        buildViewHierarchy()
        addConstraints()
        bindLayoutEvents()
    }

    private func buildViewHierarchy() {
        [
            languagesSegmentedControl,
            tokenizeTitle,
            tokenizeTextView,
            tokenizeButton,
            resultTitle,
            resultLabel,
            UIView()
        ].forEach(stackView.addArrangedSubview)
        addSubview(stackView)
    }

    private func addConstraints() {
        tokenizeTextView.translatesAutoresizingMaskIntoConstraints = false
        tokenizeTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        tokenizeButton.translatesAutoresizingMaskIntoConstraints = false
        tokenizeButton.heightAnchor.constraint(equalToConstant: 44).isActive = true

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.large).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.large).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.large).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Spacing.large).isActive = true
        stackView.widthAnchor.constraint(equalTo: widthAnchor, constant: -48).isActive = true
        stackView.setCustomSpacing(Spacing.large, after: tokenizeButton)
    }

    private func bindLayoutEvents() {
        languagesSegmentedControl.addTarget(self,
                                            action: #selector(didSelectLanguageSegmentedControl),
                                            for: .valueChanged)
        tokenizeButton.addTarget(self,
                                 action: #selector(didTapTokenizeButton),
                                 for: .touchUpInside)
    }

    @objc
    private func didSelectLanguageSegmentedControl() {
        didSelectLanguage?(languagesSegmentedControl.selectedSegmentIndex)
    }

    @objc
    private func didTapTokenizeButton() {
        didTapTokenize?(tokenizeTextView.text)
    }
}

extension TokenizerView: TokenizerViewType {

    func show(viewModel: TokenizerViewModel) {
        languagesSegmentedControl.removeAllSegments()
        for (index, language) in viewModel.languages.enumerated() {
            languagesSegmentedControl.insertSegment(withTitle: language, at: index, animated: false)
        }
        languagesSegmentedControl.selectedSegmentIndex = viewModel.selectedLanguageIndex

        resultTitle.isHidden = (viewModel.tokenizedResult == nil)
        resultLabel.isHidden = (viewModel.tokenizedResult == nil)
        resultLabel.text = viewModel.tokenizedResult
    }
}
