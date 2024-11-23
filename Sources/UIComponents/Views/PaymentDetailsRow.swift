import SwiftUI
import Inject
import UIComponentsProtocols

public struct PaymentDetailsRow: View, PaymentDetailsRowProtocol {

    let title: String
    let value: String
    @ObserveInjection var inject

    public init(title: String, 
                value: String) {
        self.title = title
        self.value = value
    }

    public var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }
        .font(.tableContent3M)
        .foregroundStyle(ThemePalette.text.primary.three)
        .padding([.trailing], defaultPadding)
        .enableInjection()
    }
}

struct PaymentDetailsRow_Previews: PreviewProvider {
    static var previews: some View {
        PaymentDetailsRow(title: "id", value: "1234")
            .setupUIComponents()
    }
}
