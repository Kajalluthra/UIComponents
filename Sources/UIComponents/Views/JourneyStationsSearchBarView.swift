import SwiftUI
import Core
import Inject
import UIComponentsProtocols

public struct JourneyStationsSearchBarView: View, JourneyStationsSearchBarViewProtocol {
    
    var placeholderText: String
    var direction: Directions
    @Binding var selectedStation: String
    @Binding var selectedStationCode: String
    var onTapSearchBar: () -> Void
    var onResetSelection: () -> Void
    
    @ObserveInjection var inject
    
    public init(placeholderText: String,
                direction: Directions,
                selectedStation: Binding<String>,
                selectedStationCode: Binding<String>,
                onTapSearchBar: @escaping () -> Void,
                onResetSelection: @escaping () -> Void) {
        self.placeholderText = placeholderText
        self.direction = direction
        self._selectedStation = selectedStation
        self._selectedStationCode = selectedStationCode
        self.onTapSearchBar = onTapSearchBar
        self.onResetSelection = onResetSelection
    }
    
    public var body: some View {
        Group {
            if selectedStation.isEmpty {
                EmptyStationSearchBarContent(placeholderText: placeholderText, onTap: onTapSearchBar)
            } else {
                let directionText = direction == .arriving ? "to.text".localized : "from.text".localized
                SelectedStationSearchBarContent(directionText: directionText,
                                                selectedStation: selectedStation,
                                                selectedStationCode: selectedStationCode,
                                                onTap: onTapSearchBar,
                                                onReset: onResetSelection)
            }
        }
        .enableInjection()
    }
}

struct JourneyStationsSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        JourneyStationsSearchBarView(placeholderText: "Search",
                                     direction: .departing,
                                     selectedStation: .constant("London"),
                                     selectedStationCode: .constant("LBG"),
                                     onTapSearchBar: {},
                                     onResetSelection: {})
        .setupUIComponents()
    }
}
