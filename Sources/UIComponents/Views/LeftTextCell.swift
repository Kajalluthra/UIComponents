import SwiftUI
import UIComponentsProtocols

public struct LeftTextCell: View, LeftTextCellProtocol {

    let title: String
    let subtitle: String?

    public init(title: String, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
        HStack {
            Text(title)
                .font(.tableTitle2SemiBold)
                .foregroundStyle(ThemePalette.text.primary.one)
            Spacer()
            Text(subtitle ?? "")
                .font(.paragraphP3Light)
                .foregroundStyle(ThemePalette.text.primary.one)
            ArrowForwardLightView(color: ThemePalette.icons.universal.brand)
        }
    }
}

struct LeftTextCell_Previews: PreviewProvider {
    static var previews: some View {
        LeftTextCell(title: "Passengers", subtitle: "1 Adult")
            .setupUIComponents()
    }
}
