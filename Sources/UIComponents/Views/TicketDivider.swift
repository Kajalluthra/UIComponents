import SwiftUI
import UIComponentsProtocols

public struct TicketDivider: View, TicketDividerProtocol {
    
    public init() {}
    
    public var body: some View {
        HStack(spacing: defaultPadding) {
            HalfCircle()
                .fill(ThemePalette.base.theme.primaryBackground)
                .frame(width: 12, height: 12)
                .rotationEffect(.degrees(90))
                .overlay(
                    HalfCircle()
                        .stroke(ThemePalette.base.containerStroke.defaultStroke, lineWidth: 1)
                        .frame(width: 12, height: 12)
                        .rotationEffect(.degrees(90))
                )
            RoundedRectangle(cornerRadius: 4)
                .stroke(ThemePalette.base.containerStroke.defaultStroke, lineWidth: 1)
                .background(ThemePalette.base.containerFill.strong)
                .frame(height: 8)
            HalfCircle()
                .fill(ThemePalette.base.theme.primaryBackground)
                .frame(width: 12, height: 12)
                .rotationEffect(.degrees(-90))
                .overlay(
                    HalfCircle()
                        .stroke(ThemePalette.base.containerStroke.defaultStroke, lineWidth: 1)
                        .frame(width: 12, height: 12)
                        .rotationEffect(.degrees(-90))
                )
        }
        .padding([.leading, .trailing], -7)
    }
}

struct TicketDivider_Previews: PreviewProvider {
    static var previews: some View {
        TicketDivider()
            .setupUIComponents()
    }
}

