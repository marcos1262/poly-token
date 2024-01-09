import Quick
import Nimble

@testable import PolyToken

final class TokenizerViewControllerTests: QuickSpec {

    override class func spec() {

        var sut: TokenizerViewController!

        var presenterSpy: TokenizerPresenterSpy!
        var viewSpy: TokenizerViewSpy!

        beforeEach {
            presenterSpy = TokenizerPresenterSpy()
            viewSpy = TokenizerViewSpy()

            sut = TokenizerViewController(presenter: presenterSpy, contentView: viewSpy)
        }

        describe("#viewDidLoad") {
            beforeEach {
                sut.viewDidLoad()
            }

            it("sets title correctly") {
                expect(sut.title) == "PolyTokenizer"
            }

            it("calls presenter didLoadView method") {
                expect(presenterSpy.didLoadViewCallCount) == 1
            }

            context("bindLayoutEvents") {

                context("when calling view didSelectLanguage closure") {
                    beforeEach {
                        viewSpy.didSelectLanguage?(1)
                    }

                    it("calls presenter didSelectLanguage method with correct paremeter") {
                        expect(presenterSpy.didSelectLanguageParameters) == [1]
                    }
                }

                context("when calling view didTapTokenize closure") {
                    beforeEach {
                        viewSpy.didTapTokenize?("Test")
                    }

                    it("calls presenter didTapTokenize method with correct paremeter") {
                        expect(presenterSpy.didTapTokenizeParameters) == ["Test"]
                    }
                }
            }
        }

        describe("#show") {
            beforeEach {
                sut.show(viewModel: .stub())
            }

            it("calls view show method with correct parameter") {
                expect(viewSpy.showParameters) == [.stub()]
            }
        }
    }
}
