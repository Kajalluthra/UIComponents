import SwiftUI
import Inject
import UIComponentsProtocols
import Core

public struct CallingPointsHeaderView: View, CallingPointsHeaderViewProtocol {
    var departOrArrivalTime: String
    var mainStationName: String
    var destinationOrOriginStationName: String
    var direction: Directions
    @ObserveInjection var inject

    public init(departOrArrivalTime: String,
                mainStationName: String,
                destinationOrOriginStationName: String,
                direction: Directions) {
        self.departOrArrivalTime = departOrArrivalTime
        self.mainStationName = mainStationName
        self.destinationOrOriginStationName = destinationOrOriginStationName
        self.direction = direction
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Text("\(departOrArrivalTime) \(mainStationName)")
                .font(.header4SemiBold)
                .foregroundStyle(ThemePalette.text.primary.two)
            let toOrFromText = direction == .departing ? "calling.points.header.to.text" : "calling.points.header.from.text"
            Text(toOrFromText.localized)
                .font(.header4Light)
                .foregroundColor(ThemePalette.text.primary.three)
            +
            Text(destinationOrOriginStationName)
                .font(.header4SemiBold)
                .foregroundColor(ThemePalette.text.primary.two)
        }
        .padding([.leading, .trailing], defaultPadding)
        .enableInjection()
    }
}

struct CallingPointsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CallingPointsHeaderView(departOrArrivalTime: "08:15", mainStationName: "London Blackfriars", destinationOrOriginStationName: "Manchester Picadilly", direction: .departing)
            .setupUIComponents()
    }
}
