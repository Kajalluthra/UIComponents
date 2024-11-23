import SwiftUI
import MarkdownUI
import Inject
import Core
import UIComponentsProtocols

public struct SummaryFooterView: View, SummaryFooterViewProtocol {

    let price: Float
    let currency: String
    @ObserveInjection var inject

    public init(price: Float, currency: String) {
        self.price = price
        self.currency = currency
    }

    public var body: some View {
        VStack(spacing: defaultPadding / 2) {
            HStack(alignment: .bottom) {
                Spacer()
                Text("total.text".localized)
                    .font(.header4Light)
                    .foregroundStyle(ThemePalette.text.primary.one)
                    .padding([.bottom], defaultPadding / 4)
                PriceText(price: price, currency: currency)
            }
            .padding([.trailing], defaultPadding)
            Markdown("agreement.text".localized)
                .markdownStyle(
                    MarkdownStyle(
                        font: .custom("Poppins-Light", size: 14), foregroundColor: ThemePalette.text.primary.one, measurements: .init()
                    )
                )
                .accentColor(ThemePalette.text.interaction.textLink)
        }
        .padding(defaultPadding)
        .enableInjection()
    }
}

struct SummaryFooterView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryFooterView(price: 35.3, currency: Currency.pounds.rawValue)
            .setupUIComponents()
    }
}
