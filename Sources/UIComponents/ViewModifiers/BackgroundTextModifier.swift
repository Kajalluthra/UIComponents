import SwiftUI

public struct BackgroundTextModifier: ViewModifier {

    public init() {}

    public func body(content: Content) -> some View {
        content
            .font(.paragraphP2Light)
            .foregroundStyle(ThemePalette.text.primary.one)
            .padding(defaultPadding)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(ThemePalette.base.containerStroke.defaultStroke)
                    .background(ThemePalette.base.containerFill.secondary)
            )
    }
}
