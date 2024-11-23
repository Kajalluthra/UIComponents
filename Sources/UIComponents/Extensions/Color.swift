import SwiftUI

extension Color {
    public var uiColor: UIColor {
        return UIColor(self)
    }
    
    public func isEqual(to color: Color) -> Bool {
        guard let selfComponents = self.normalizedRGBAComponents(),
              let otherComponents = color.normalizedRGBAComponents() else {
            return false
        }
        return selfComponents == otherComponents
    }
    
    private func normalizedRGBAComponents() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        guard let components = self.rgbaComponents() else { return nil }
        
        let red = round(components.red * 1000) / 1000
        let green = round(components.green * 1000) / 1000
        let blue = round(components.blue * 1000) / 1000
        let alpha = round(components.alpha * 1000) / 1000
        
        return (red, green, blue, alpha)
    }
    
    private func rgbaComponents() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        guard uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }
        return (red, green, blue, alpha)
    }
    
}
