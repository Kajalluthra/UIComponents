import SwiftUI

public struct PrimaryLightButtonStyle: ButtonStyle {

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        PrimaryLightButtonStyleView(configuration: configuration)
    }
}

private extension PrimaryLightButtonStyle {
    struct PrimaryLightButtonStyleView: View {

        @Environment(\.isEnabled) var isEnabled

        let configuration: PrimaryLightButtonStyle.Configuration

        var body: some View {
            configuration.label
                .padding()
                .foregroundStyle(isEnabled ? ThemePalette.text.interaction.primaryTwo : ThemePalette.text.function.disabled)
                .font(.buttonT1)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(isEnabled ? ThemePalette.interaction.fill.primaryTwo : ThemePalette.interaction.fill.disabled)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                .clipShape(Capsule())
                .padding()
        }
    }
}

struct PrimaryLightButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {} label: {
                Text("search.show.results.button.title")
            }
            .buttonStyle(PrimaryLightButtonStyle())
            Button {} label: {
                Text("search.show.results.button.title")
            }
            .buttonStyle(PrimaryLightButtonStyle())
            .disabled(true)
        }
    }
}
