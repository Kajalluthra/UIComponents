import SwiftUI
import UIComponentsProtocols

public struct TicketDetailsDisclosureLabel: View, TicketDetailsDisclosureLabelProtocol {

    let title: String
    let totalPrice: String
    @Binding var detailsShown: Bool
    private let imageWidth = 13.0

    public init(title: String, 
                totalPrice: String,
                detailsShown: Binding<Bool>) {
        self.title = title
        self.totalPrice = totalPrice
        self._detailsShown = detailsShown
    }

    public var body: some View {
        Button {
            withAnimation(.default) {
                detailsShown.toggle()
            }
        } label: {
            VStack {
                HStack {
                    Text(title)
                        .font(.tableTitle2SemiBold)
                        .foregroundStyle(ThemePalette.text.primary.one)
                    Spacer()
                    Text(totalPrice)
                        .font(.paragraphP3Light)
                        .foregroundStyle(ThemePalette.text.primary.one)
                    Image(detailsShown ? "ArrowUpLight" : "ArrowDownLight", bundle: UIComponents.bundle)
                        .resizable()
                        .foregroundStyle(ThemePalette.icons.universal.brand)
                        .frame(width: imageWidth, height: imageWidth / 2)
                }
                CustomHorizontalDivider(color: ThemePalette.base.containerStroke.divider)
            }
        }
    }
}

struct TicketsDetailsDisclosureLabel_Previews: PreviewProvider {
    static var previews: some View {
        TicketDetailsDisclosureLabel(title: "Title", totalPrice: "0.0", detailsShown: .constant(false))
            .setupUIComponents()
    }
}
