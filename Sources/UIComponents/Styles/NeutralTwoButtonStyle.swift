import SwiftUI

public struct NeutralTwoButtonStyle: ButtonStyle {

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        NeutralTwoButtonStyleView(configuration: configuration)
    }
}

internal extension NeutralTwoButtonStyle {
    struct NeutralTwoButtonStyleView: View {

        @Environment(\.isEnabled) var isEnabled

        let configuration: NeutralTwoButtonStyle.Configuration

        var body: some View {
            configuration.label
                .padding()
                .foregroundStyle(isEnabled ? ThemePalette.text.interaction.neutral : ThemePalette.text.function.disabled)
                .font(.buttonT4)
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(isEnabled ? ThemePalette.interaction.fill.neutralTwo : ThemePalette.interaction.fill.disabled)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                .cornerRadius(4)
                .padding()
        }
    }
}

struct NeutralTwoButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {} label: {
                Text("search.show.results.button.title")
            }
            .buttonStyle(NeutralTwoButtonStyle())
            Button {} label: {
                Text("search.show.results.button.title")
            }
            .buttonStyle(NeutralTwoButtonStyle())
            .disabled(true)
        }
    }
}

