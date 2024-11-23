import SwiftUI
import Inject
import UIComponentsProtocols

public struct SelectionRow: View, SelectionRowProtocol {
    let title: String
    var isSelected: Bool

    @ObserveInjection var inject

    public init(title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }

    public var body: some View {
        HStack {
            Text(title)
                .font(.tableTitle2SemiBold)
                .foregroundStyle(ThemePalette.text.primary.one)
            Spacer()
            if isSelected {
                Image("TickLight", bundle: UIComponents.bundle)
                    .resizable()
                    .foregroundStyle(ThemePalette.interaction.fill.focus)
                    .frame(width: 14, height: 14)
            }
        }
        .padding()
        .background(isSelected ? ThemePalette.base.theme.primaryBackground : .clear)
        .overlay(
            RoundedRectangle(cornerRadius: 2)
                .stroke(isSelected ? ThemePalette.base.containerStroke.focus : .clear, lineWidth: 1)
        )
        .contentShape(Rectangle())
        .enableInjection()
    }
}

struct SelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        SelectionRow(title: "Title", isSelected: true)
            .setupUIComponents()
    }
}
