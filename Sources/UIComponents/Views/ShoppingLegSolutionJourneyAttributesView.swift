import SwiftUI
import UIComponentsProtocols

/// The view used to show the attributes of a journey in a shopping leg
/// solution.
public struct ShoppingLegSolutionJourneyAttributesView: View, ShoppingLegSolutionJourneyAttributesViewProtocol {

    let journeyWarningKind: JourneyWarningKind?
    let representsFastestJourney: Bool

    public init(journeyWarningKind: JourneyWarningKind? = nil,
                representsFastestJourney: Bool) {
        self.journeyWarningKind = journeyWarningKind
        self.representsFastestJourney = representsFastestJourney
    }

    public var body: some View {
        HStack {
            if let journeyWarningView = journeyWarningKind?.viewRepresentation {
                journeyWarningView
            }
            Spacer()
            if representsFastestJourney {
                Image("FastestJourney", bundle: UIComponents.bundle)
            }
        }
    }
}

extension JourneyWarningKind {
    var viewRepresentation: some View {

        var tintColor: Color {
            switch self {
            case .busReplacement:
                return ThemePalette.icons.universal.warningCritical
            case .overtakenService:
                return ThemePalette.icons.universal.warningImportant
            }
        }
        return HStack {
            Image(iconImageName, bundle: UIComponents.bundle)
            Text(message)
                .font(.label2S)
                .lineLimit(1)
                .foregroundStyle(tintColor)
        }
        .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
        .background(tintColor.opacity(0.1))
        .cornerRadius(2)
    }

    private var iconImageName: String {
        switch self {
        case .busReplacement:
            return "BusReplacement"
        case .overtakenService:
            return "OvertakenService"
        }
    }

    private var message: String {
        switch self {
        case .busReplacement:
            return "bus.replacement".localized
        case .overtakenService:
            return "overtaken.service".localized
        }
    }
}

struct ShoppingLegSolutionJourneyAttributesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ShoppingLegSolutionJourneyAttributesView(journeyWarningKind: .busReplacement, representsFastestJourney: false)
                .previewDisplayName("Bus Replacement")
            ShoppingLegSolutionJourneyAttributesView(journeyWarningKind: .overtakenService, representsFastestJourney: false)
                .previewDisplayName("Overtaken Service")
            ShoppingLegSolutionJourneyAttributesView(journeyWarningKind: nil, representsFastestJourney: true)
                .previewDisplayName("Fastest Journey")
        }
        .setupUIComponents()
    }
}
