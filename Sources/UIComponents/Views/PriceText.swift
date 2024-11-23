import SwiftUI
import Inject
import Core
import UIComponentsProtocols

public struct PriceText: View, PriceTextProtocol {

    var price: Float
    var currency: String
    var isSmallFont: Bool = true
    var priceString: [String] {
        return price.formattedWithSeparator.components(separatedBy: Formatter.withSeparator.decimalSeparator)
    }
    @ObserveInjection var inject

    public init(price: Float, 
                currency: String,
                isSmallFont: Bool = true) {
        self.price = price
        self.currency = currency
        self.isSmallFont = isSmallFont
    }

    public var body: some View {
        (Text(CurrencyUtils.getSymbolForCurrencyCode(code: currency) ?? "")
            .font(isSmallFont ? .display9 : .display6)
         +
         Text(priceString.first ?? "")
            .font(.display4)
         +
         (Text(Formatter.withSeparator.decimalSeparator))
         +
         Text(priceString.last ?? "")
            .font(isSmallFont ? .display9 : .display6))
        .foregroundStyle(price == 0 ? ThemePalette.text.function.success : ThemePalette.text.primary.one)
        .lineLimit(1)
        .minimumScaleFactor(0.5)
        .enableInjection()
    }
}

struct BalanceText_Previews: PreviewProvider {
    static var previews: some View {
        PriceText(price: 122.0, currency: Currency.pounds.rawValue)
            .setupUIComponents()
    }
}
