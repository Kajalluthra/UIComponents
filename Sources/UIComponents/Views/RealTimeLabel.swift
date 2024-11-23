import SwiftUI
import Core
import Inject
import UIComponentsProtocols

public struct RealTimeLabel: View, RealTimeLabelProtocol {
    
    let trainStatus: TrainStatus
    let scheduledTime: String
    let realTime: String?
    @ObserveInjection var inject

    public init(trainStatus: TrainStatus, 
                scheduledTime: String,
                realTime: String? = nil) {
        self.trainStatus = trainStatus
        self.scheduledTime = scheduledTime
        self.realTime = realTime
    }

    public var body: some View {
        Text(self.getText())
            .font(self.getFont())
            .foregroundStyle(self.getColor())
            .enableInjection()
    }
}

extension RealTimeLabel {

    private func getText() -> String {
        switch trainStatus {
        case .cancelled, .canceled:
            return ""
        case .onTime:
            return trainStatus.getStatusText()
        case .departed, .arrived:
            if scheduledTime == realTime {
                return TrainStatus.onTime.getStatusText()
            } else {
                return realTime ?? ""
            }
        case .delayed:
            return realTime ?? ""
        }
    }

    private func getFont() -> Font {
        switch trainStatus {
        case .onTime:
            return .label4M
        case .departed, .arrived:
            if scheduledTime == realTime {
                return .label4M
            } else {
                return .display9
            }
        default:
            return .display9
        }
    }

    private func getColor() -> Color {
        switch trainStatus {
        case .onTime:
            return ThemePalette.spotColours.signalling.positiveResult
        case .departed, .arrived:
            if scheduledTime == realTime {
                return ThemePalette.spotColours.signalling.positiveResult
            } else {
                return ThemePalette.spotColours.signalling.negativeResult
            }
        default:
            return ThemePalette.spotColours.signalling.negativeResult
        }
    }
}

struct RealTimeLabel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RealTimeLabel(trainStatus: .onTime, scheduledTime: "08:15", realTime: "08:15")
            RealTimeLabel(trainStatus: .delayed, scheduledTime: "08:15", realTime: "08:20")
            RealTimeLabel(trainStatus: .departed, scheduledTime: "08:15", realTime: "08:20")
        }
        .previewLayout(.sizeThatFits)
        .setupUIComponents()
    }
}
