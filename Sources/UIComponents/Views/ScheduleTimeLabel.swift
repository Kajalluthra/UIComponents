import SwiftUI
import Core
import Inject
import UIComponentsProtocols

public struct ScheduleTimeLabel: View, ScheduleTimeLabelProtocol {
    
    let trainStatus: TrainStatus
    let scheduledTime: String

    @ObserveInjection var inject

    public init(trainStatus: TrainStatus,
                scheduledTime: String) {
        self.trainStatus = trainStatus
        self.scheduledTime = scheduledTime
    }

    public var body: some View {
        Text(scheduledTime)
            .font(.display6)
            .foregroundStyle(self.getTextColor())
            .enableInjection()
    }
}

extension ScheduleTimeLabel {
    func getTextColor() -> Color {
        switch trainStatus {
        case .onTime, .delayed:
            return ThemePalette.text.primary.one
        case .departed, .arrived:
            return ThemePalette.text.primary.three
        case .cancelled, .canceled:
            return ThemePalette.text.function.warningCritical
        }
    }
}

struct ScheduleTimeLabel_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleTimeLabel(trainStatus: .onTime, scheduledTime: "08:15")
            .setupUIComponents()
    }
}
