import SwiftUI

extension Picker {
    public func customPickerStyle(labelText: String) -> some View {
        self.modifier(CustomPickerStyle(labelText: labelText))
    }
}
