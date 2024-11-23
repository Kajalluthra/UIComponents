import Foundation
import SwiftUI

public struct WhiteCapsuleButtonStyle: ButtonStyle {

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        WhiteCapsuleButtonStyleView(configuration: configuration)
    }
}

private extension WhiteCapsuleButtonStyle {
    struct WhiteCapsuleButtonStyleView: View {

        @Environment(\.isEnabled) var isEnabled
        let configuration: WhiteCapsuleButtonStyle.Configuration

        var body: some View {
            configuration.label
                .padding()
                .foregroundStyle(isEnabled ? Color(uiColor: UIColor(hexString: "#002D30")!) : ThemePalette.text.function.disabled)
                .font(.paragraphP3Medium)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(isEnabled ? .white : ThemePalette.interaction.fill.disabled)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                .clipShape(Capsule())
                .padding()
        }
    }
}
