import SwiftUI
import Core

public protocol ArrowForwardLightViewProtocol: View {
    init(color: Color)
}

public protocol ActivityIndicatorProtocol: View {
    init(isVisible: Binding<Bool>, activityIndicatorText: String?)
}

public protocol ApplePayButtonProtocol: View {
    init(action: @escaping () -> Void)
}

public protocol BannerProtocol: View {
    init(message: String, messageColor: Color, leftColor: Color, borderColor: Color, backgroundColor: Color, font: Font)
}

public protocol BannerBackgroundProtocol: View {
    init(lineColor: Color)
}

public protocol CallingPointsHeaderViewProtocol: View {
    init(departOrArrivalTime: String,
         mainStationName: String,
         destinationOrOriginStationName: String,
         direction: Directions)
}

public protocol CancelButtonProtocol: View {
    init(foregroundColor: Color?, action: @escaping () -> Void)
}

public protocol ChangesAndDurationViewProtocol: View {
    init(numChanges: Int, duration: String, showChangesAndDurationOnly: Bool, defaultHeight: CGFloat, showJourneyDetails: Binding<Bool>)
}

public protocol CheapestBannerViewProtocol: View {
    init(cornersToRound: UIRectCorner)
}

public protocol ChildViewWithNavigationProtocol: View {
    init(presentingTitle: String)
}

public protocol CloseButtonViewProtocol: View {
    init(onPress: (() -> Void)?)
}

public protocol CustomAlertProtocol: View {
    init(presentAlert: Binding<Bool>, title: String, message: String)
}

public protocol CustomHorizontalDividerProtocol: View {
    init(color: Color, frame: CGFloat)
}

public protocol CustomProgressViewProtocol: View {
    init(value: Double, total: Double)
}

public protocol DateAndTimeSelectorViewProtocol: View {
    init(isViewPresented: Binding<Bool>,
         directionSelected: Binding<Directions>,
         dateSelectedIndex: Binding<Int?>,
         dateSelected: Binding<Date>,
         referenceDate: Date,
         tripDirection: TripDirection)
}

public protocol DateSelectComponentProtocol: View {
    init(selectedIndex: Binding<Int?>,
         selectedDate: Binding<Date>,
         directionSelected: Binding<Directions>,
         showDateAndTimeSelector: Binding<Bool>,
         selectedDateString: String)
}

public protocol DirectionComponentProtocol: View {
    init(selectorPresented: Binding<Bool>, directionSelected: Binding<Directions>)
}

public protocol DirectionSelectorViewProtocol: View {
    init(selectorPresented: Binding<Bool>,
         selectedItem: Binding<Directions>)
}

public protocol EmailSentViewProtocol: View {
    init(email: String, explanationText: String, resendEmailAction: @escaping () -> Void)
}

public protocol EmptyStationSearchBarContentProtocol: View {
    init(placeholderText: String, isOptionalField: Bool, onTap: @escaping () -> Void)
}

public protocol ErrorBannerProtocol: View {
    init(title: String?,
         messages: [String],
         iconName: String,
         isCollapsible: Bool,
         displayMessage: Bool)
}

public protocol FareAdditionalInformationViewProtocol: View {
    init(title: String,
         additionalDetails: [String])
}

public protocol FavouriteStationCellProtocol: View {
    init(title: String,
         removalHandler: (() -> Void)?)
}

public protocol FlexibleLayoutHStackProtocol: View {
    associatedtype Model
    associatedtype ViewGenerator
    
    init(models: [Model],
         viewGenerator: ViewGenerator)
}

public protocol FloatingLabelTextFieldProtocol: View {
    init(_ title: String,
         text: Binding<String>,
         format: String?,
         validator: Validator?,
         isValid: Binding<Bool>,
         isSecureField: Bool,
         hideFloatingLabel: Bool,
         customValidationMessage: String)
}

public protocol GenericErrorViewProtocol: View {
    init(title: String?,
         message: String?,
         buttonText: String?,
         buttonAction: (() -> Void)?)
}

public protocol JourneyStationsSearchBarViewProtocol: View {
    init(placeholderText: String,
         direction: Directions,
         selectedStation: Binding<String>,
         selectedStationCode: Binding<String>,
         onTapSearchBar: @escaping () -> Void,
         onResetSelection: @escaping () -> Void)
}

public protocol JourneyTypeSelectorViewProtocol: View {
    init(selection: Binding<JourneyType>,
         journeyTypes: Binding<[JourneyType]>)
}

public protocol LeftTextCellProtocol: View {
    init(title: String, subtitle: String?)
}

public protocol LiveTrainsSkeletonViewProtocol: View {
    init(isVisible: Binding<Bool>)
}

public protocol LoadingButtonProtocol: View {
    associatedtype Content
    
    init(action: @escaping () -> Void,
         isLoading: Binding<Bool>,
         loadingButtonStyle: LoadingButtonStyle,
         @ViewBuilder builder: () -> Content)
}

public protocol LoadMoreItemsViewProtocol: View {
    init(text: String, imageName: String, action: @escaping () -> Void)
}

public protocol NavigationTitleViewProtocol: View {
    init(primaryText: String,
         secondaryText: String,
         rightNavigationButtonAction: RightNavigationButtonAction?)
}

public protocol OfflineBannerProtocol: View {
    init()
}

public protocol OriginAndDestinationViewProtocol: View {
    init(originStationName: String,
         destinationStationName: String,
         font: Font,
         foregroundStyle: Color)
}

public protocol PagerIndicatorViewProtocol: View {
    init(numberOfPages: Int, currentPage: Binding<Int>)
}

public protocol PassengersSelectorCellProtocol: View {
    init(title: String,
         ageRangeText: String,
         maxValue: Int,
         disableAddButton: Bool,
         value: Binding<Int>)
}

public protocol PaymentDetailsRowProtocol: View {
    init(title: String,
         value: String)
}

public protocol PriceTextProtocol: View {
    init(price: Float,
         currency: String,
         isSmallFont: Bool)
}

public protocol RadioButtonViewProtocol: View {
    init(index: Int,
         text: String,
         description: String,
         selectedIndex: Binding<Int>)
}

public protocol RealTimeLabelProtocol: View {
    init(trainStatus: TrainStatus,
         scheduledTime: String,
         realTime: String?)
}

public protocol ResultsSearchBarViewProtocol: View {
    init(searchText: Binding<String>)
}

//TODO: First we need to extract Theme to a target or module to use SegmentedControlStyle here
//public protocol RoundedSegmentedControlProtocol: View {
//    init(selectedIndex: Binding<Int>, options: [String], style: SegmentedControlStyle)
//}

public protocol SafariWebViewProtocol: View {
    init(url: URL)
}

public protocol ScheduleTimeLabelProtocol: View {
    init(trainStatus: TrainStatus,
         scheduledTime: String)
}

public protocol SearchDateComponentProtocol: View {
    init(dateSelection: Binding<Int?>,
         selectedDate: Binding<Date>,
         selectedReturnDate: Binding<Date>,
         directionSelected: Binding<Directions>,
         directionSelectorPresented: Binding<Bool>,
         returnDirectionSelected: Binding<Directions>,
         journeyType: JourneyType)
}

public protocol SelectedStationSearchBarContentProtocol: View {
    init(directionText: String,
         selectedStation: String,
         selectedStationCode: String,
         onTap: @escaping () -> Void,
         onReset: @escaping () -> Void)
}

public protocol SelectionRowProtocol: View {
    init(title: String, isSelected: Bool)
}

public protocol ShoppingLegSolutionJourneyAttributesViewProtocol: View {
    init(journeyWarningKind: JourneyWarningKind?,
         representsFastestJourney: Bool)
}

public protocol SummaryFooterViewProtocol: View {
    init(price: Float, currency: String)
}

public protocol TermsAndConditionsViewProtocol: View {
    init()
}

public protocol TicketDetailsDisclosureLabelProtocol: View {
    init(title: String,
         totalPrice: String,
         detailsShown: Binding<Bool>)
}

public protocol TicketDividerProtocol: View {
    init()
}

public protocol TimeAndStatusViewProtocol: View {
    init(status: TrainStatus,
         time: String,
         actualTime: String?,
         alignment: HorizontalAlignment)
}

public protocol TrainStatusLabelProtocol: View {
    init(trainStatus: TrainStatus)
}
