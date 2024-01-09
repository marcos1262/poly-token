import Quick
import Nimble

@testable import PolyToken

final class LanguageTests: QuickSpec {

    override class func spec() {

        var sut: Language!

        describe("#title") {
            context("when case is .english") {
                beforeEach {
                    sut = .english
                }
                it("returns correct value") {
                    expect(sut.title) == "English"
                }
            }

            context("when case is .portuguese") {
                beforeEach {
                    sut = .portuguese
                }
                it("returns correct value") {
                    expect(sut.title) == "Portuguese"
                }
            }
        }

        describe("#tokens") {
            context("when case is .english") {
                beforeEach {
                    sut = .english
                }
                it("returns correct value") {
                    expect(sut.tokens) == ["and", "if"]
                }
            }

            context("when case is .portuguese") {
                beforeEach {
                    sut = .portuguese
                }
                it("returns correct value") {
                    expect(sut.tokens) == ["e", "se"]
                }
            }
        }
    }
}
