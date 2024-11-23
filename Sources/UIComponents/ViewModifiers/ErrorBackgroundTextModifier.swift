import SwiftUI

public struct ErrorBackgroundTextModifier: ViewModifier {

    public func body(content: Content) -> some View {
        content
                .font(.paragraphP3Light)
                .foregroundStyle(ThemePalette.text.function.warningCritical)
                .padding([.top, .bottom], defaultPadding)
                .padding([.trailing], defaultPadding / 4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading], defaultPadding)
                .background(
                        ZStack(alignment: .leading) {
                            ThemePalette.base.containerStroke.error
                                    .cornerRadius(4)
                            Color(.white)
                                    .cornerRadius(4, corners: [.topRight, .bottomRight])
                                    .padding([.leading], 8)
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(ThemePalette.base.containerStroke.error, lineWidth: 1)
                        }
                )
    }
}
