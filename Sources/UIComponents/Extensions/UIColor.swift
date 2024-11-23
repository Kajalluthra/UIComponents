import Foundation
import UIKit
import SwiftUI

// MARK: - Hex Strings

extension UIColor {
    /// Creates a `UIColor` from the given RGBA hexademical string
    /// representation.
    /// - Parameter hexString: The RGBA hexadecimal color value (as a string).
    /// Can be in the form `#RGB`,  `#RGBA`, `#RRGGBB` or `#RRGGBBAA`.
    public convenience init?(hexString: String) {
        guard hexString.rangeOfCharacter(from: .hexStringCharacters.inverted) == nil else {
            return nil
        }
        let red, green, blue, alpha: String?
        let divisor: CGFloat
        let chars = Array(hexString)
        switch hexString.count {
        case 7, 9:
            red = String(chars[1 ... 2])
            green = String(chars[3 ... 4])
            blue = String(chars[5 ... 6])
            alpha = hexString.count == 9 ? String(chars[7 ... 8]) : nil
            divisor = 255
        case 4, 5:
            red = hexString[1]
            green = hexString[2]
            blue = hexString[3]
            alpha = hexString.count == 5 ? hexString[4] : nil
            divisor = 15
        default:
            return nil
        }
        
        let redFloat = CGFloat(strtoul(red, nil, 16)) / divisor
        let greenFloat = CGFloat(strtoul(green, nil, 16)) / divisor
        let blueFloat = CGFloat(strtoul(blue, nil, 16)) / divisor
        var alphaFloat: CGFloat = 1.0
        if let alpha = alpha {
            alphaFloat = CGFloat(strtoul(alpha, nil, 16)) / divisor
        }
        
        self.init(red: redFloat,
                  green: greenFloat,
                  blue: blueFloat,
                  alpha: alphaFloat)
    }
    
    static func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
        return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
    }
}

private extension CharacterSet {
    static let hexStringCharacters = CharacterSet([
        "#",
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "A",
        "B",
        "C",
        "D",
        "E",
        "F"
    ]).union(CharacterSet.decimalDigits)
}

private extension String {
    subscript(position: Int) -> String {
        guard position >= 0, position < count else { return "" }
        return String(self[index(startIndex, offsetBy: position)])
    }
}
