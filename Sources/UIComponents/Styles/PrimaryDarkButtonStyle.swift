import SwiftUI

public struct PrimaryDarkButtonStyle: ButtonStyle {

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        PrimaryDarkButtonStyleView(configuration: configuration)
    }
}

private extension PrimaryDarkButtonStyle {
    struct PrimaryDarkButtonStyleView: View {

        @Environment(\.isEnabled) var isEnabled

        let configuration: PrimaryDarkButtonStyle.Configuration

        var body: some View {
            configuration.label
                .padding()
                .foregroundStyle(isEnabled ? ThemePalette.text.interaction.primaryOne : ThemePalette.text.function.disabled)
                .font(.buttonT1)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(isEnabled ? ThemePalette.interaction.fill.primaryOne : ThemePalette.interaction.fill.disabled)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                .clipShape(Capsule())
                .padding()
        }
    }
}

struct PrimaryDarkButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {} label: {
                Text("search.show.results.button.title")
            }
            .buttonStyle(PrimaryDarkButtonStyle())
            Button {} label: {
                Text("search.show.results.button.title")
            }
            .buttonStyle(PrimaryDarkButtonStyle())
            .disabled(true)
        }
    }
}
