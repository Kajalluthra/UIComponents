import SwiftUI
import UIComponentsProtocols

public struct CancelButton: View, CancelButtonProtocol {
    var foregroundColor: Color?
    var action: () -> Void
    
    public init(foregroundColor: Color? = nil, action: @escaping () -> Void) {
        self.action = action
        self.foregroundColor = foregroundColor
    }

    public var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Button("cancel.button".localized) {
                action()
            }
            .font(.buttonT4)
            .foregroundStyle(foregroundColor ?? ThemePalette.text.primary.one)
        }
    }
}

struct CancelButton_Previews: PreviewProvider {
    static var previews: some View {
        CancelButton {
            print("Cancel button tapped")
        }
    }
}
