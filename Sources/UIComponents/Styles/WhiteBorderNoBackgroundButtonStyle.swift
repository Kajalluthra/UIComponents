import SwiftUI

public struct WhiteBorderNoBackgroundButtonStyle: ButtonStyle {

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        WhiteBorderNoBackgroundButtonStyleView(configuration: configuration)
    }
}

private extension WhiteBorderNoBackgroundButtonStyle {
    struct WhiteBorderNoBackgroundButtonStyleView: View {

        @Environment(\.isEnabled) var isEnabled

        let configuration: WhiteBorderNoBackgroundButtonStyle.Configuration
        let buttonMaxHeight = 48.0

        var body: some View {
            configuration.label
                .padding()
                .foregroundStyle(isEnabled ? ThemePalette.text.secondary.one : ThemePalette.text.function.disabled)
                .font(.paragraphP3Medium)
                .frame(maxWidth: .infinity, maxHeight: buttonMaxHeight)
                .background(
                    RoundedRectangle(cornerRadius: buttonMaxHeight / 2)
                        .stroke(Color(UIColor(hexString: "#DCE2E6")!), lineWidth: 1)
                        .background(Color.clear)
                )
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                .clipShape(Capsule())
        }
    }
}
