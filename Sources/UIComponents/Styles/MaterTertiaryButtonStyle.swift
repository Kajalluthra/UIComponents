import SwiftUI

public struct MaterTertiaryButtonStyle: ButtonStyle {

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        MaterTertiaryButtonStyleView(configuration: configuration)
    }
}

private extension MaterTertiaryButtonStyle {
    struct MaterTertiaryButtonStyleView: View {
        @Environment(\.isEnabled) var isEnabled

        let configuration: MaterTertiaryButtonStyle.Configuration
        let buttonMaxHeight = 40.0
        var body: some View {
            configuration.label
                .padding()
                .foregroundStyle(isEnabled ? ThemePalette.text.primary.one : ThemePalette.text.function.disabled)
                .font(.buttonT4)
                .frame(maxWidth: .infinity, maxHeight: buttonMaxHeight)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(ThemePalette.interaction.stroke.fillSubtle, lineWidth: 1)
                        .background(ThemePalette.interaction.fill.fillSubtle)
                )
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                .padding(defaultPadding)
        }
    }
}

struct MaterTertiaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button {} label: {
            HStack {
                Text("Load more")
                Image("EarlierArrowLight", bundle: UIComponents.bundle)
            }
        }
        .buttonStyle(MaterTertiaryButtonStyle())
    }
}
