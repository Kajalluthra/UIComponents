import SwiftUI

public struct CheckboxStyle: ToggleStyle {
    let strokeColor: Color
    let backgroundColor: Color

    public init(strokeColor: Color, backgroundColor: Color) {
        self.strokeColor = strokeColor
        self.backgroundColor = backgroundColor
    }

    public func makeBody(configuration: Self.Configuration) -> some View {

        return HStack {
            Image(configuration.isOn ? "TickLight" : "", bundle: UIComponents.bundle)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundStyle(configuration.isOn ? ThemePalette.icons.universal.strongReverse : ThemePalette.icons.universal.strongReverse)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(configuration.isOn ? backgroundColor : strokeColor, lineWidth: 1)
                        .background(configuration.isOn ? backgroundColor : .clear)
                        .cornerRadius(4)
                        .frame(width: 24, height: 24)
                )
                configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }

    }
}
