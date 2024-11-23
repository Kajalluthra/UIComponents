import SwiftUI
import Inject
import UIComponentsProtocols

public struct JourneyTypeSelectorView: View, JourneyTypeSelectorViewProtocol {

    @Binding var selection: JourneyType
    @Binding var journeyTypes: [JourneyType]
    @ObserveInjection var inject

    public init(selection: Binding<JourneyType>,
                journeyTypes: Binding<[JourneyType]>) {
        self._selection = selection
        self._journeyTypes = journeyTypes
    }

    public var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< journeyTypes.count, id: \.self) { index in
                let verticalPadding = journeyTypes[index] == .seasonsAndFlexis ? 0.0 : 5.0 // As the last option has more lines, we need to adapt the padding properly to align elements
                VStack(spacing: 0) {
                    Image(journeyTypes[index].imageName(), bundle: UIComponents.bundle)
                        .resizable()
                        .foregroundStyle(selection == journeyTypes[index] ? ThemePalette.icons.universal.brand : ThemePalette.icons.universal.mid)
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fill)
                    Text(journeyTypes[index].rawValue)
                        .foregroundStyle(selection == journeyTypes[index] ? ThemePalette.text.primary.brand : ThemePalette.text.primary.three)
                        .font(.label4M)
                        .multilineTextAlignment(.center)
                        .padding([.top], verticalPadding)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .onTapGesture {
                    // Temporary disabling last option
                    if index != 3 {
                        selection = journeyTypes[index]
                    }
                }
            }
        }
        .enableInjection()
    }
}

struct JourneyTypeSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyTypeSelectorView(selection: .constant(.single), journeyTypes: .constant(JourneyType.allCases))
            .setupUIComponents()
    }
}
