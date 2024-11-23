import SwiftUI

public var ThemePalette: Theme.Palette { // swiftlint:disable:this variable_name
    guard let theme = UIComponents.theme else { fatalError("You have to include a valid AppTheme(Light or Dark).json in your project and call UIComponents.setup() to include it") }
    return theme.colors.palette
}

public let defaultPadding: CGFloat = 16.0

public class UIComponents {
    public static var bundle: Bundle { Bundle.customBundle }

    static var theme: Theme?

    public static func setup() {
        loadColors()
        do {
            try registerFont(named: "Poppins-Light")
            try registerFont(named: "Poppins-Regular")
            try registerFont(named: "Poppins-Medium")
            try registerFont(named: "Poppins-SemiBold")
            try registerFont(named: "Poppins-Bold")
        } catch {
            let reason = error.localizedDescription
            fatalError("Failed to register font: \(reason)")
        }
    }
    
    public static func loadColors() {
        let lightThemeJsonName = "AppThemeLight"
        let darkThemeJsonName = "AppThemeDark"
        let appLightThemeUrl = Bundle.main.url(forResource: lightThemeJsonName, withExtension: "json")
        let moduleLightThemeUrl = bundle.url(forResource: lightThemeJsonName, withExtension: "json")
        let appDarkThemeUrl = Bundle.main.url(forResource: darkThemeJsonName, withExtension: "json")
        let moduleDarkThemeUrl = bundle.url(forResource: darkThemeJsonName, withExtension: "json")
        theme = Theme(lightThemeUrl: appLightThemeUrl ?? moduleLightThemeUrl, darkThemeUrl: appDarkThemeUrl ?? moduleDarkThemeUrl)
    }
}
