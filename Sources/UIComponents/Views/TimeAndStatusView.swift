import SwiftUI
import Core
import Inject
import UIComponentsProtocols

public struct TimeAndStatusView: View, TimeAndStatusViewProtocol {

    let status: TrainStatus
    let time: String
    let actualTime: String?
    let alignment: HorizontalAlignment
    @ObserveInjection var inject

    public init(status: TrainStatus,
                time: String,
                actualTime: String?,
                alignment: HorizontalAlignment) {
        self.status = status
        self.time = time
        self.actualTime = actualTime
        self.alignment = alignment
    }
    
    public var body: some View {
        VStack(alignment: alignment) {
            Text(status.getStatusText())
                .font(.label2S)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundStyle(status == .onTime ? ThemePalette.spotColours.signalling.positiveResult : ThemePalette.spotColours.signalling.negativeResult)
            Text(time)
                .font(.header4SemiBold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundStyle(ThemePalette.text.primary.one)
            let actualTime = status == .delayed ? actualTime : ""
            Text(actualTime ?? "")
                .font(.tableContent2M)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundStyle(ThemePalette.text.function.error)
        }
        .padding([.top], defaultPadding)
        .enableInjection()
    }
}

struct TimeAndStatusView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TimeAndStatusView(status: .onTime, time: "08:00", actualTime: nil, alignment: .leading)
                .previewDisplayName("On time")
            TimeAndStatusView(status: .delayed, time: "08:00", actualTime: "08:10", alignment: .leading)
                .previewDisplayName("Delayed")
            TimeAndStatusView(status: .cancelled, time: "08:00", actualTime: nil, alignment: .leading)
                .previewDisplayName("Cancelled")
            TimeAndStatusView(status: .departed, time: "08:00", actualTime: "08:05", alignment: .leading)
                .previewDisplayName("Departed")
        }
        .setupUIComponents()
    }
}
