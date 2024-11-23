import SwiftUI
import Inject
import UIComponentsProtocols

public struct SelectedStationSearchBarContent: View, SelectedStationSearchBarContentProtocol {

    var directionText: String
    var selectedStation: String
    var selectedStationCode: String
    var onTap: () -> Void
    var onReset: () -> Void

    @ObserveInjection var inject

    public init(directionText: String, 
                selectedStation: String,
                selectedStationCode: String,
                onTap: @escaping () -> Void,
                onReset: @escaping () -> Void) {
        self.directionText = directionText
        self.selectedStation = selectedStation
        self.selectedStationCode = selectedStationCode
        self.onTap = onTap
        self.onReset = onReset
    }

    public var body: some View {
        HStack {
            HStack {
                Text(directionText)
                    .font(.label2S)
                    .foregroundStyle(ThemePalette.text.primary.three)
                    .frame(minWidth: 34, alignment: .trailing)
                Text(selectedStation)
                    .foregroundStyle(ThemePalette.text.primary.one)
                    .font(.paragraphP3Medium)
                    .lineLimit(1)
                    .accessibilityIdentifier(StationSearchBarAccessibilityIdentifiers.name.rawValue)
                if !selectedStationCode.isEmpty {
                    Text("[\(selectedStationCode)]")
                        .foregroundStyle(ThemePalette.text.primary.three)
                        .font(.paragraphP3Light)
                        .accessibilityIdentifier(StationSearchBarAccessibilityIdentifiers.code.rawValue)
                }
                Spacer()
            }
            .onTapGesture {
                onTap()
            }
            Button {
                onReset()
            } label: {
                Image("CircleCloseLight", bundle: UIComponents.bundle)
                    .frame(width: 32, height: 32)
                    .foregroundStyle(ThemePalette.icons.universal.mid)
            }
            .frame(alignment: .trailing)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .stroke(ThemePalette.base.containerStroke.forms, lineWidth: 1)
                .frame(height: 56)
                .background(ThemePalette.base.containerFill.forms)
                .cornerRadius(4)
        )
        .enableInjection()
    }
}

struct SelectedStationSearchBarContent_Previews: PreviewProvider {
    static var previews: some View {
        SelectedStationSearchBarContent(directionText: "From:", selectedStation: "London", selectedStationCode: "LBG", onTap: {}, onReset: {})
            .setupUIComponents()
    }
}
