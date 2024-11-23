import SwiftUI

public struct ClearButtonStyle: ButtonStyle {

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        ClearButtonStyleView(configuration: configuration)
    }
}

private extension ClearButtonStyle {
    struct ClearButtonStyleView: View {

        @Environment(\.isEnabled) var isEnabled
        let configuration: ClearButtonStyle.Configuration

        var body: some View {
            configuration.label
                .padding()
                .foregroundStyle(isEnabled ? ThemePalette.text.primary.one : ThemePalette.text.function.disabled)
                .font(.label4M)
                .frame(maxHeight: 48)
                .background(Color.clear)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
        }
    }
}
