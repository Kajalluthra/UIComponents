import SwiftUI
import Core
import Inject
import UIComponentsProtocols

public struct TrainStatusLabel: View, TrainStatusLabelProtocol {

    let trainStatus: TrainStatus
    @ObserveInjection var inject
    
    public init(trainStatus: TrainStatus) {
        self.trainStatus = trainStatus
    }

    public var body: some View {
        let textColor = trainStatus == .cancelled || trainStatus == .delayed ? ThemePalette.spotColours.signalling.negativeResult : ThemePalette.text.primary.three
        Text(trainStatus.getStatusText())
            .font(.label4M)
            .foregroundStyle(textColor)
            .opacity(trainStatus == .onTime ? 0 : 1)
            .enableInjection()
    }
}

struct TrainStatusLabel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TrainStatusLabel(trainStatus: TrainStatus.delayed)
            TrainStatusLabel(trainStatus: TrainStatus.cancelled)
            TrainStatusLabel(trainStatus: TrainStatus.onTime)
            TrainStatusLabel(trainStatus: TrainStatus.departed)
            TrainStatusLabel(trainStatus: TrainStatus.arrived)
        }
        .setupUIComponents()
    }
}
