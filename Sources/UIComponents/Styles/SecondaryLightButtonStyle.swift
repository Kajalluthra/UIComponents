import SwiftUI

public struct SecondaryLightButtonStyle: ButtonStyle {

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        SecondaryLightButtonStyleView(configuration: configuration)
    }
}

internal extension SecondaryLightButtonStyle {
    struct SecondaryLightButtonStyleView: View {

        @Environment(\.isEnabled) var isEnabled

        let configuration: SecondaryLightButtonStyle.Configuration

        var body: some View {
            configuration.label
                .padding()
                .foregroundStyle(isEnabled ? ThemePalette.text.interaction.primaryTwo : ThemePalette.text.function.disabled)
                .font(.buttonT4)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(isEnabled ? ThemePalette.interaction.fill.primaryTwo : ThemePalette.interaction.fill.disabled)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                .cornerRadius(4)
                .padding()
        }
    }
}

struct SecondaryLightButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {} label: {
                Text("search.show.results.button.title")
            }
            .buttonStyle(SecondaryLightButtonStyle())
            Button {} label: {
                Text("search.show.results.button.title")
            }
            .buttonStyle(SecondaryLightButtonStyle())
            .disabled(true)
        }
    }
}
