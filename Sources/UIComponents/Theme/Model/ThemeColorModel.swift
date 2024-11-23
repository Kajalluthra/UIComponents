import SwiftUI

/// Represents the structure used in theme JSON files that represent a theme
/// color.

struct ThemeColorModel: Decodable {
    let type: String
    let value: String
    var color: Result<UIColor, ThemeColorError> {
        do {
            let color = try getColor()
            return .success(color)
        } catch let error as ThemeColorError {
            return .failure(error)
        } catch {
            return .failure(.unparsableHexString(hexString: value))
        }
        
    }
    
    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case value = "$value"
    }
    
    private func getColor() throws -> UIColor {
        guard let color = UIColor(hexString: value) else {
            throw ThemeColorError.unparsableHexString(hexString: value)
        }
        return color
    }
}

enum ThemeColorError: Error, LocalizedError {
    case unparsableHexString(hexString: String)
    
    var errorDescription: String? {
        switch self {
        case let .unparsableHexString(hexString):
            return "Could not parse hex color with hex string \"\(hexString)\""
        }
    }
}
