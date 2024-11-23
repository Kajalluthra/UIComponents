import SwiftUI
import Inject
import UIComponentsProtocols

public struct PassengersSelectorCell: View, PassengersSelectorCellProtocol {

    var title: String
    var ageRangeText: String
    var maxValue: Int
    var disableAddButton: Bool
    @Binding var value: Int
    @ObserveInjection var inject

    public init(title: String,
                ageRangeText: String,
                maxValue: Int,
                disableAddButton: Bool,
                value: Binding<Int>) {
        self.title = title
        self.ageRangeText = ageRangeText
        self.maxValue = maxValue
        self.disableAddButton = disableAddButton
        self._value = value
    }

    public var body: some View {
        HStack {
            Text(title)
                .font(.tableTitle2SemiBold)
                .foregroundStyle(ThemePalette.text.primary.one)
            Text(ageRangeText)
                .font(.tableContent1L)
                .foregroundStyle(ThemePalette.text.primary.one)
            Spacer()
            MiddleLabelStepper(value: $value, maxValue: maxValue, disableAddButton: disableAddButton)
        }
        .enableInjection()
    }
}

struct PassengersSelectorCell_Previews: PreviewProvider {
    static var previews: some View {
        PassengersSelectorCell(title: "Adults", ageRangeText: "(16+)", maxValue: 9, disableAddButton: false, value: .constant(0))
            .setupUIComponents()
    }
}
