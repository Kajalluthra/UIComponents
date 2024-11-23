import Foundation

public enum JourneyType: String, CaseIterable {
    case single = "Single"
    case returnJourney = "Return"
    case openReturn = "Open return"
    case seasonsAndFlexis = """
    Seasons
    & Flexis
    """

    public func imageName() -> String {
        switch self {
        case .single:
            return "JourneySingleBold"
        case .returnJourney:
            return "JourneyReturnBold"
        case .openReturn:
            return "JourneyOpenReturnBold"
        case .seasonsAndFlexis:
            return "JourneySeasonBold"
        }
    }
}
