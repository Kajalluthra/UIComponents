import SwiftUI

public struct SecondaryDarkButtonStyle: ButtonStyle {

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        SecondaryDarkButtonStyleView(configuration: configuration)
    }
}

private extension SecondaryDarkButtonStyle {
    struct SecondaryDarkButtonStyleView: View {

        @Environment(\.isEnabled) var isEnabled

        let configuration: SecondaryDarkButtonStyle.Configuration

        var body: some View {
            configuration.label
                .padding()
                .foregroundStyle(isEnabled ? ThemePalette.text.interaction.neutral : ThemePalette.text.function.disabled)
                .font(.buttonT2)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(isEnabled ? ThemePalette.interaction.fill.neutralOne : ThemePalette.interaction.fill.disabled)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                .cornerRadius(4)
                .padding()
        }
    }
}

struct SecondaryDarkButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {} label: {
                Text("search.show.results.button.title")
            }
            .buttonStyle(SecondaryDarkButtonStyle())
            Button {} label: {
                Text("search.show.results.button.title")
            }
            .buttonStyle(SecondaryDarkButtonStyle())
            .disabled(true)
        }
    }
}
