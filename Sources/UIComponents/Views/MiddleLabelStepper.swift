import SwiftUI
import Inject

struct MiddleLabelStepper: View {

    @Binding var value: Int
    var maxValue: Int
    var disableAddButton: Bool
    @ObserveInjection var inject

    init(value: Binding<Int>,
                maxValue: Int,
                disableAddButton: Bool) {
        self._value = value
        self.maxValue = maxValue
        self.disableAddButton = disableAddButton
    }

    var body: some View {
        let elementsSpacing = 30.0
        HStack(spacing: elementsSpacing) {
            Button {
                value = value > 0 ? value - 1 : 0
            } label: {
                Image("CircleRemoveLight", bundle: UIComponents.bundle)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundStyle(value == 0 ? ThemePalette.icons.universal.disabled : ThemePalette.icons.universal.brand)
            }
            .disabled(value == 0)
            Text("\(value)")
                .font(.tableTitle2SemiBold)
                .foregroundStyle(ThemePalette.text.primary.one)
                .frame(minWidth: 10)
            Button {
                value = value < maxValue ? value + 1 : maxValue
            } label: {
                Image("CircleAddLight", bundle: UIComponents.bundle)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundStyle((value == maxValue || disableAddButton) ? ThemePalette.icons.universal.disabled : ThemePalette.icons.universal.brand)
            }
            .disabled(value == maxValue || disableAddButton)
        }
        .enableInjection()
    }
}

struct MiddleLabelStepper_Previews: PreviewProvider {
    static var previews: some View {
        MiddleLabelStepper(value: .constant(0), maxValue: 9, disableAddButton: false)
            .setupUIComponents()
    }
}
