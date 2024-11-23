import XCTest
@testable import UIComponents

final class UIColorExtensionsTests: XCTestCase {
    func testItCanParseASixCharacterHexString() {
        XCTAssertEqual(UIColor(hexString: "#000000"), UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#FF0000"), UIColor(red: 1, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#00FF00"), UIColor(red: 0, green: 1, blue: 0, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#0000FF"), UIColor(red: 0, green: 0, blue: 1, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#FFFFFF"), UIColor(red: 1, green: 1, blue: 1, alpha: 1))
    }

    func testItCanParseAnEightCharacterHexString() {
        XCTAssertEqual(UIColor(hexString: "#00000000"), UIColor(red: 0, green: 0, blue: 0, alpha: 0))
        XCTAssertEqual(UIColor(hexString: "#FF0000FF"), UIColor(red: 1, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#00FF00FF"), UIColor(red: 0, green: 1, blue: 0, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#0000FFFF"), UIColor(red: 0, green: 0, blue: 1, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#FFFFFFFF"), UIColor(red: 1, green: 1, blue: 1, alpha: 1))
    }

    func testItCanParseAThreeCharacterHexString() {
        XCTAssertEqual(UIColor(hexString: "#000"), UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#F00"), UIColor(red: 1, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#0F0"), UIColor(red: 0, green: 1, blue: 0, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#00F"), UIColor(red: 0, green: 0, blue: 1, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#FFF"), UIColor(red: 1, green: 1, blue: 1, alpha: 1))
    }

    func testItCanParseAFourCharacterHexString() {
        XCTAssertEqual(UIColor(hexString: "#0000"), UIColor(red: 0, green: 0, blue: 0, alpha: 0))
        XCTAssertEqual(UIColor(hexString: "#F00F"), UIColor(red: 1, green: 0, blue: 0, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#0F0F"), UIColor(red: 0, green: 1, blue: 0, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#00FF"), UIColor(red: 0, green: 0, blue: 1, alpha: 1))
        XCTAssertEqual(UIColor(hexString: "#FFFF"), UIColor(red: 1, green: 1, blue: 1, alpha: 1))
    }
    
    func testItDoesNotInitialiseWithAnInvalidLengthString() {
        XCTAssertNil(UIColor(hexString: "#00000"))
    }

    func testItDoesNotInitialiseWithInvalidCharacters() {
        XCTAssertNil(UIColor(hexString: "#notvalid"))
    }
}
