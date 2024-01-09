import Quick
import Nimble

@testable import PolyToken

final class TokenizerAdapterTests: QuickSpec {

    override class func spec() {

        var sut: TokenizerAdapter!

        beforeEach {
            sut = TokenizerAdapter()
        }

        describe("#adapt") {
            var viewModel: TokenizerViewModel?

            context("when languages does Not contain selectedLanguage") {
                beforeEach {
                    viewModel = sut.adapt(from: .stub(languages: [.english, .english],
                                                      selectedLanguage: .portuguese))
                }

                it("returns correct value") {
                    expect(viewModel) == .stub(languages: ["English", "English"],
                                               selectedLanguageIndex: 0)
                }
            }

            context("when textToTokenize is Nil") {
                beforeEach {
                    viewModel = sut.adapt(from: .stub(textToTokenize: nil))
                }

                it("returns correct value") {
                    expect(viewModel) == .stub()
                }
            }

            context("when textToTokenize is empty") {
                beforeEach {
                    viewModel = sut.adapt(from: .stub(textToTokenize: ""))
                }

                it("returns correct value") {
                    expect(viewModel) == .stub()
                }
            }

            context("when there is textToTokenize") {
                beforeEach {
                    viewModel = sut.adapt(from: .stub(textToTokenize: "Test 1 and test 2 if test 3"))
                }

                it("returns correct value") {
                    expect(viewModel) == .stub(tokenizedResult: "- Test 1 \n- And test 2 \n- If test 3")
                }

                context("when language is portuguese") {
                    beforeEach {
                        viewModel = sut.adapt(from: .stub(selectedLanguage: .portuguese,
                                                          textToTokenize: "Teste 1 e teste 2 se teste 3"))
                    }

                    it("returns correct value") {
                        expect(viewModel) == .stub(selectedLanguageIndex: 1,
                                                   tokenizedResult: "- Teste 1 \n- E teste 2 \n- Se teste 3")
                    }
                }
            }
        }
    }
}
