import Quick
import Nimble

@testable import PolyToken

final class TokenizerPresenterTests: QuickSpec {

    override class func spec() {

        var sut: TokenizerPresenter!

        var adapterSpy: TokenizerAdapterSpy!
        var controllerSpy: TokenizerViewControllerSpy!

        beforeEach {
            adapterSpy = TokenizerAdapterSpy()
            controllerSpy = TokenizerViewControllerSpy()

            sut = TokenizerPresenter(adapter: adapterSpy)
            sut.controller = controllerSpy
        }

        describe("#didLoadView") {
            beforeEach {
                sut.didLoadView()
            }

            it("calls adapter adapt method with correct parameter") {
                expect(adapterSpy.adaptParameters) == [.stub()]
            }

            it("calls controller show method with correct parameter") {
                expect(controllerSpy.showParameters) == [.stub()]
            }
        }

        describe("#didSelectLanguage") {

            context("when index is invalid") {
                beforeEach {
                    sut.didSelectLanguage(at: -1)
                }

                it("does Not call adapter adapt method") {
                    expect(adapterSpy.adaptParameters) == []
                }

                it("does Not call controller show method") {
                    expect(controllerSpy.showParameters) == []
                }
            }

            context("when index is valid") {
                beforeEach {
                    sut.didSelectLanguage(at: 1)
                }

                it("calls adapter adapt method with correct parameter") {
                    expect(adapterSpy.adaptParameters) == [.stub(selectedLanguage: .portuguese)]
                }

                it("calls controller show method with correct parameter") {
                    expect(controllerSpy.showParameters) == [.stub()]
                }
            }
        }

        describe("#didTapTokenize") {
            beforeEach {
                sut.didTapTokenize(with: "Test")
            }

            it("calls adapter adapt method with correct parameter") {
                expect(adapterSpy.adaptParameters) == [.stub(textToTokenize: "Test")]
            }

            it("calls controller show method with correct parameter") {
                expect(controllerSpy.showParameters) == [.stub()]
            }
        }
    }
}
