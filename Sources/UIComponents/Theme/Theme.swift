import SwiftUI

// The theme to be applied to UI components.
final public class Theme {
    
    /* Initialises a theme using the JSON configuration file at the given URL.
     - Parameter lightThemeUrl: The `URL` of the light theme configuration file.
     - Parameter darkThemeUrl: The `URL` of the dark theme configuration file. */
    public init?(lightThemeUrl: URL?, darkThemeUrl: URL?) {
        guard let lightThemeUrl = lightThemeUrl else {
            return nil
        }
        
        let darkThemeUrl = darkThemeUrl ?? lightThemeUrl
        
        do {
            let lightData = try Data(contentsOf: lightThemeUrl)
            let darkData = try Data(contentsOf: darkThemeUrl)
            let lightModel = try JSONDecoder().decode(ThemeModel.self, from: lightData)
            let darkModel = try JSONDecoder().decode(ThemeModel.self, from: darkData)
            colors = try Colors(lightPaletteModel: lightModel, darkPaletteModel: darkModel)
        } catch {
            debugPrint(error)
            print("Error attempting to generate theme from \(lightThemeUrl.absoluteString), \(darkThemeUrl.absoluteString): \(error.localizedDescription)")
            return nil
        }
    }
    
    // The colors of the theme.
    let colors: Colors
    
    public struct Colors {
        let palette: Palette
        
        init(lightPaletteModel: ThemeModel, darkPaletteModel: ThemeModel) throws {
            palette = try Palette(lightPaletteModel: lightPaletteModel, darkPaletteModel: darkPaletteModel)
        }
    }
}
