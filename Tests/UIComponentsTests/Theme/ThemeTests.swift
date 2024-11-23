import XCTest
import SwiftUI
@testable import UIComponents

final class ThemeTests: XCTestCase {
    private(set) var theme: Theme!
    
    override func tearDown() {
        theme = nil
        super.tearDown()
    }
    
    private func givenATheme(fromFileNamed themeFilename: String, inBundle bundle: Bundle) {
        let lightUrl = bundle.url(forResource: "\(themeFilename)Light", withExtension: "json")
        let darkUrl = bundle.url(forResource: "\(themeFilename)Dark", withExtension: "json")
        theme = Theme(lightThemeUrl: lightUrl, darkThemeUrl: darkUrl)
    }
}

// MARK: - Loading

extension ThemeTests {
    func testItLoadsAValidTheme() {
        givenATheme(fromFileNamed: "SterlingTheme", inBundle: Bundle.module)
        XCTAssertNotNil(theme)
    }
    
    func testItDoesNotLoadAnInvalidTheme() {
        givenATheme(fromFileNamed: "Invalid Theme", inBundle: Bundle.module)
        XCTAssertNil(theme)
    }
    
    func testItDoesNotLoadANonExistantTheme() {
        givenATheme(fromFileNamed: "I Don't Exist", inBundle: Bundle.module)
        XCTAssertNil(theme)
    }
}

// MARK: - Colors

extension ThemeTests {
    func testItLoadsColorsCorrectly() {
        givenATheme(fromFileNamed: "SterlingTheme", inBundle: Bundle.module)
        XCTAssertTrue(theme.colors.palette.base.theme.primaryBackground.isEqual(to: Color(UIColor(hexString: "#F8F9FA")!)))
        XCTAssertTrue(theme.colors.palette.base.theme.appSecondaryBackgroundOne.isEqual(to: Color(UIColor(hexString: "#194245")!)))
        XCTAssertTrue(theme.colors.palette.base.theme.appSecondaryBackgroundTwo.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        
        XCTAssertTrue(theme.colors.palette.base.containerFill.primary.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.base.containerFill.secondary.isEqual(to: Color(UIColor(hexString: "#F8F9FA")!)))
        XCTAssertTrue(theme.colors.palette.base.containerFill.strong.isEqual(to: Color(UIColor(hexString: "#F1F3F5")!)))
        XCTAssertTrue(theme.colors.palette.base.containerFill.dominant.isEqual(to: Color(UIColor(hexString: "#002D30")!)))
        XCTAssertTrue(theme.colors.palette.base.containerFill.forms.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.base.containerFill.noteworthy.isEqual(to: Color(UIColor(hexString: "#F8F9FA")!)))
        XCTAssertTrue(theme.colors.palette.base.containerFill.important.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.base.containerFill.positive.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.base.containerFill.error.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.base.containerFill.warningCritical.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.base.containerFill.warningImportant.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.base.containerFill.warningMild.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        
        XCTAssertTrue(theme.colors.palette.base.containerStroke.defaultStroke.isEqual(to: Color(UIColor(hexString: "#DCE2E6")!)))
        XCTAssertTrue(theme.colors.palette.base.containerStroke.forms.isEqual(to: Color(UIColor(hexString: "#DCE2E6")!)))
        XCTAssertTrue(theme.colors.palette.base.containerStroke.focus.isEqual(to: Color(UIColor(hexString: "#3399FF")!)))
        XCTAssertTrue(theme.colors.palette.base.containerStroke.divider.isEqual(to: Color(UIColor(hexString: "#EAEEF0")!)))
        XCTAssertTrue(theme.colors.palette.base.containerStroke.noteworthy.isEqual(to: Color(UIColor(hexString: "#99ABAC")!)))
        XCTAssertTrue(theme.colors.palette.base.containerStroke.important.isEqual(to: Color(UIColor(hexString: "#FF4069")!)))
        XCTAssertTrue(theme.colors.palette.base.containerStroke.success.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        XCTAssertTrue(theme.colors.palette.base.containerStroke.error.isEqual(to: Color(UIColor(hexString: "#D90F0F")!)))
        XCTAssertTrue(theme.colors.palette.base.containerStroke.warningCritical.isEqual(to: Color(UIColor(hexString: "#D90F0F")!)))
        XCTAssertTrue(theme.colors.palette.base.containerStroke.warningImportant.isEqual(to: Color(UIColor(hexString: "#F56A2E")!)))
        XCTAssertTrue(theme.colors.palette.base.containerStroke.warningMild.isEqual(to: Color(UIColor(hexString: "#F5BD2E")!)))
        XCTAssertTrue(theme.colors.palette.base.containerStroke.disabled.isEqual(to: Color(UIColor(hexString: "#EBEBEB")!)))
        
        XCTAssertTrue(theme.colors.palette.text.primary.one.isEqual(to: Color(UIColor(hexString: "#002D30")!)))
        XCTAssertTrue(theme.colors.palette.text.primary.two.isEqual(to: Color(UIColor(hexString: "#194245")!)))
        XCTAssertTrue(theme.colors.palette.text.primary.three.isEqual(to: Color(UIColor(hexString: "#668183")!)))
        XCTAssertTrue(theme.colors.palette.text.primary.brand.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        XCTAssertTrue(theme.colors.palette.text.secondary.one.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.text.function.noteworthy.isEqual(to: Color(UIColor(hexString: "#002D30")!)))
        XCTAssertTrue(theme.colors.palette.text.function.important.isEqual(to: Color(UIColor(hexString: "#FF4069")!)))
        XCTAssertTrue(theme.colors.palette.text.function.success.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        XCTAssertTrue(theme.colors.palette.text.function.error.isEqual(to: Color(UIColor(hexString: "#D90F0F")!)))
        XCTAssertTrue(theme.colors.palette.text.function.warningCritical.isEqual(to: Color(UIColor(hexString: "#D90F0F")!)))
        XCTAssertTrue(theme.colors.palette.text.function.warningImportant.isEqual(to: Color(UIColor(hexString: "#F56A2E")!)))
        XCTAssertTrue(theme.colors.palette.text.function.warningMild.isEqual(to: Color(UIColor(hexString: "#F5BD2E")!)))
        XCTAssertTrue(theme.colors.palette.text.function.disabled.isEqual(to: Color(UIColor(hexString: "#D6D6D6")!)))
        
        XCTAssertTrue(theme.colors.palette.text.interaction.primaryOne.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.text.interaction.primaryTwo.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.text.interaction.positive.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.text.interaction.neutral.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.text.interaction.negative.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.text.interaction.textLink.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        
        XCTAssertTrue(theme.colors.palette.icons.universal.brand.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        XCTAssertTrue(theme.colors.palette.icons.universal.strong.isEqual(to: Color(UIColor(hexString: "#002D30")!)))
        XCTAssertTrue(theme.colors.palette.icons.universal.mid.isEqual(to: Color(UIColor(hexString: "#668183")!)))
        XCTAssertTrue(theme.colors.palette.icons.universal.strongReverse.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.icons.universal.noteworthy.isEqual(to: Color(UIColor(hexString: "#668183")!)))
        XCTAssertTrue(theme.colors.palette.icons.universal.important.isEqual(to: Color(UIColor(hexString: "#FF4069")!)))
        XCTAssertTrue(theme.colors.palette.icons.universal.success.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        XCTAssertTrue(theme.colors.palette.icons.universal.error.isEqual(to: Color(UIColor(hexString: "#D90F0F")!)))
        XCTAssertTrue(theme.colors.palette.icons.universal.warningCritical.isEqual(to: Color(UIColor(hexString: "#D90F0F")!)))
        XCTAssertTrue(theme.colors.palette.icons.universal.warningImportant.isEqual(to: Color(UIColor(hexString: "#F56A2E")!)))
        XCTAssertTrue(theme.colors.palette.icons.universal.warningMild.isEqual(to: Color(UIColor(hexString: "#F5BD2E")!)))
        XCTAssertTrue(theme.colors.palette.icons.universal.disabled.isEqual(to: Color(UIColor(hexString: "#D6D6D6")!)))
        XCTAssertTrue(theme.colors.palette.icons.inButtons.primaryOne.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.icons.inButtons.primaryTwo.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.icons.inButtons.positive.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.icons.inButtons.neutral.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.icons.inButtons.negative.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        
        XCTAssertTrue(theme.colors.palette.interaction.fill.primaryOne.isEqual(to: Color(UIColor(hexString: "#194245")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.primaryTwo.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.positive.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.neutralOne.isEqual(to: Color(UIColor(hexString: "#335759")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.neutralTwo.isEqual(to: Color(UIColor(hexString: "#668183")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.negative.isEqual(to: Color(UIColor(hexString: "#D90F0F")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.floating.isEqual(to: Color(UIColor(hexString: "#FFFFFF00")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.fillSubtle.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.focus.isEqual(to: Color(UIColor(hexString: "#3399FF")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.focusSoft.isEqual(to: Color(UIColor(hexString: "#D6EBFF")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.brand.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.strong.isEqual(to: Color(UIColor(hexString: "#002D30")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.disabled.isEqual(to: Color(UIColor(hexString: "#EBEBEB")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.hoverState.isEqual(to: Color(UIColor(hexString: "#0000000D")!)))
        XCTAssertTrue(theme.colors.palette.interaction.fill.clickState.isEqual(to: Color(UIColor(hexString: "#00000026")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.primaryOne.isEqual(to: Color(UIColor(hexString: "#194245")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.primaryTwo.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.positive.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.neutralOne.isEqual(to: Color(UIColor(hexString: "#335759")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.neutralTwo.isEqual(to: Color(UIColor(hexString: "#668183")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.negative.isEqual(to: Color(UIColor(hexString: "#D90F0F")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.floating.isEqual(to: Color(UIColor(hexString: "#FFFFFF00")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.fillSubtle.isEqual(to: Color(UIColor(hexString: "#DCE2E6")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.focus.isEqual(to: Color(UIColor(hexString: "#3399FF")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.focusSoft.isEqual(to: Color(UIColor(hexString: "#D6EBFF")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.brand.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.strong.isEqual(to: Color(UIColor(hexString: "#002D30")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.disabled.isEqual(to: Color(UIColor(hexString: "#EBEBEB")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.hoverState.isEqual(to: Color(UIColor(hexString: "#0000000D")!)))
        XCTAssertTrue(theme.colors.palette.interaction.stroke.clickState.isEqual(to: Color(UIColor(hexString: "#00000033")!)))
        
        XCTAssertTrue(theme.colors.palette.journeyDiagram.future.isEqual(to: Color(UIColor(hexString: "#194245")!)))
        XCTAssertTrue(theme.colors.palette.journeyDiagram.present.isEqual(to: Color(UIColor(hexString: "#D6EBFF")!)))
        XCTAssertTrue(theme.colors.palette.journeyDiagram.past.isEqual(to: Color(UIColor(hexString: "#99ABAC")!)))
        XCTAssertTrue(theme.colors.palette.journeyDiagram.cancelled.isEqual(to: Color(UIColor(hexString: "#D6D6D6")!)))
        XCTAssertTrue(theme.colors.palette.journeyDiagram.liveLocation.isEqual(to: Color(UIColor(hexString: "#3399FF")!)))
        
        XCTAssertTrue(theme.colors.palette.spotColours.signalling.positiveResult.isEqual(to: Color(UIColor(hexString: "#00B169")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.signalling.negativeResult.isEqual(to: Color(UIColor(hexString: "#D90F0F")!)))
        
        XCTAssertTrue(theme.colors.palette.spotColours.ticketStub.fill.isEqual(to: Color(UIColor(hexString: "#194245")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.ticketStub.iconOne.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.ticketStub.iconTwo.isEqual(to: Color(UIColor(hexString: "#0F7658")!)))
        
        XCTAssertTrue(theme.colors.palette.spotColours.splitTicket.main.isEqual(to: Color(UIColor(hexString: "#AF3FD7")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.splitTicket.one.isEqual(to: Color(UIColor(hexString: "#EFD9F7")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.splitTicket.two.isEqual(to: Color(UIColor(hexString: "#D79FEB")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.splitTicket.three.isEqual(to: Color(UIColor(hexString: "#194245")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.splitTicket.four.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        
        XCTAssertTrue(theme.colors.palette.spotColours.co2.mainText.isEqual(to: Color(UIColor(hexString: "#002D30")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.co2.one.isEqual(to: Color(UIColor(hexString: "#00B169")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.co2.two.isEqual(to: Color(UIColor(hexString: "#00C575")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.co2.three.isEqual(to: Color(UIColor(hexString: "#E2F2EC")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.co2.car.isEqual(to: Color(UIColor(hexString: "#668183")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.co2.plane.isEqual(to: Color(UIColor(hexString: "#335759")!)))
        
        XCTAssertTrue(theme.colors.palette.spotColours.cheapestBanner.fill.isEqual(to: Color(UIColor(hexString: "#00B169")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.cheapestBanner.text.isEqual(to: Color(UIColor(hexString: "#FFFFFF")!)))
        XCTAssertTrue(theme.colors.palette.spotColours.cheapestBanner.stroke.isEqual(to: Color(UIColor(hexString: "#009E5E")!)))
    }
}
