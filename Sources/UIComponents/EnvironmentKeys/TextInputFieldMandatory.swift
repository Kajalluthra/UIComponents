import Foundation
import SwiftUI

private struct TextInputFieldMandatory: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    public var isMandatory: Bool {
        get { self[TextInputFieldMandatory.self] }
        set { self[TextInputFieldMandatory.self] = newValue}
    }
}
