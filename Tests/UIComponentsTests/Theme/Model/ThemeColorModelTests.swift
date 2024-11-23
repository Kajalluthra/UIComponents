import XCTest
@testable import UIComponents

final class ThemeColorModelTests: XCTestCase {
    private var colorModel: ThemeColorModel!
    private var vendedColor: UIColor!
    private var parsingError: Error!
    
    override func tearDown() {
        colorModel = nil
        vendedColor = nil
        parsingError = nil
        super.tearDown()
    }
    
    private func givenAColorModel(withConfiguration configuration: String) {
        do {
            colorModel = try JSONDecoder().decode(ThemeColorModel.self, from: configuration.data(using: .utf8)!)
            try colorModel.color.get()
        } catch {
            parsingError = error
        }
    }
}

// MARK: - Invalid Configuration

extension ThemeColorModelTests {
    func testItThrowsAnErrorWhenTheColorCannotBeParsed() {
        givenAColorModel(withConfiguration: ThemeColorModelTests.InvalidConfiguration.invalidColor)
        XCTAssertEqual(parsingError.localizedDescription, "Could not parse hex color with hex string \"not a color\"")
    }
    
    func testItThrowsAnErrorWhenTheColorContainsTheWrongProperties() {
        givenAColorModel(withConfiguration: ThemeColorModelTests.InvalidConfiguration.wrongProperties)
        XCTAssertNotNil(parsingError)
    }
    
    func testItThrowsAnErrorWhenTheDynamicColorContainsTheWrongProperties() {
        givenAColorModel(withConfiguration: ThemeColorModelTests.InvalidConfiguration.wrongProperties)
        XCTAssertNotNil(parsingError)
    }
    
    func testItThrowsAnErrorWhenTheModelKindIsNotRecognised() {
        givenAColorModel(withConfiguration: ThemeColorModelTests.InvalidConfiguration.unrecognisedType)
        XCTAssertNotNil(parsingError)
    }
}

private extension ThemeColorModelTests {
    enum ValidConfiguration {
        static let color: String = """
        {
          "$type": "color",
          "$value": "#00FF00"
        }
        """
    }
    
    enum InvalidConfiguration {
        static let invalidColor: String = """
        {
            "$type": "color",
            "$value": "not a color"
        }
        """
        
        static let wrongProperties: String = """
        {
            "$type": "color",
            "$hello": "bye"
        }
        """
        
        static let unrecognisedType: String = """
        {
            "$type": "not a type",
            "$value": "bye"
        }
        """
    }
}
