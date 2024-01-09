import Quick
import Nimble
import Nimble_Snapshots
import UIKit

@testable import PolyToken

final class TokenizerViewTests: QuickSpec {

    override class func spec() {

        var sut: TokenizerView!

        beforeEach {
            sut = TokenizerView()
            sut.frame.size = .iPhoneSE

            sut.show(viewModel: .stub())
        }

        describe("#show") {

            context("when result is Nil") {
                it("has valid snapshot") {
                    expect(sut) == snapshot()
                }
            }

            context("when there is result") {
                beforeEach {
                    sut.show(viewModel: .stub(selectedLanguageIndex: 1,
                                              tokenizedResult: "- Test 1\n- And test 2\n If test 3"))

                    let tokenizeTextView: UITextView? = Mirror.extract("tokenizeTextView", from: sut)
                    tokenizeTextView?.text = "Test 1 and test 2 if test 3"
                }

                it("has valid snapshot") {
                    expect(sut) == snapshot()
                }
            }
        }

        describe("#bindLayoutEvents") {

            context("when user changes language") {
                var selectedIndex: Int?

                beforeEach {
                    sut.didSelectLanguage = { index in
                        selectedIndex = index
                    }

                    let languagesSegmentedControl: UISegmentedControl? = Mirror.extract("languagesSegmentedControl", from: sut)
                    languagesSegmentedControl?.selectedSegmentIndex = 1
                    languagesSegmentedControl?.sendActions(for: .valueChanged)
                }

                it("calls didSelectLanguage closure with correct paremeter") {
                    expect(selectedIndex) == 1
                }
            }

            context("when user taps on tokenize") {
                var selectedText: String?

                beforeEach {
                    sut.didTapTokenize = { text in
                        selectedText = text
                    }

                    let tokenizeTextView: UITextView? = Mirror.extract("tokenizeTextView", from: sut)
                    tokenizeTextView?.text = "Test"

                    let tokenizeButton: UIButton? = Mirror.extract("tokenizeButton", from: sut)
                    tokenizeButton?.sendActions(for: .touchUpInside)
                }

                it("calls didTapTokenize closure with correct paremeter") {
                    expect(selectedText) == "Test"
                }
            }
        }
    }
}
