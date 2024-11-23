import Foundation
import SwiftUI

private struct TextInputFieldMatchValue: EnvironmentKey {
    static var defaultValue: String = ""
}

extension EnvironmentValues {
    public var matchValue: String {
        get { self[TextInputFieldMatchValue.self] }
        set { self[TextInputFieldMatchValue.self] = newValue }
    }
}
