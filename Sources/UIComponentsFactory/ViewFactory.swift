import SwiftUI
import UIComponents
import UIComponentsProtocols
import Core

public class ViewFactory {
    
    public static func activityIndicator(isVisible: Binding<Bool>, activityIndicatorText: String? = nil) -> some ActivityIndicatorProtocol {
        ActivityIndicator(isVisible: isVisible, activityIndicatorText: activityIndicatorText)
    }
    
    public static func applePayButton(action: @escaping () -> Void) -> some ApplePayButtonProtocol {
        ApplePayButton(action: action)
    }
    
    public static func arrowForwardLightView(color: Color) -> some ArrowForwardLightViewProtocol {
        ArrowForwardLightView(color: color)
    }
    
    public static func banner(message: String, messageColor: Color, leftColor: Color, borderColor: Color, backgroundColor: Color, font: Font) -> some BannerProtocol {
        Banner(message: message, messageColor: messageColor, leftColor: leftColor, borderColor: borderColor, backgroundColor: backgroundColor, font: font)
    }
    
    public static func bannerBackground(lineColor: Color) -> some BannerBackgroundProtocol {
        BannerBackground(lineColor: lineColor)
    }
    
    public static func callingPointsHeaderView(departOrArrivalTime: String,
                                               mainStationName: String,
                                               destinationOrOriginStationName: String,
                                               direction: Directions) -> some CallingPointsHeaderViewProtocol {
        CallingPointsHeaderView(departOrArrivalTime: departOrArrivalTime,
                                mainStationName: mainStationName,
                                destinationOrOriginStationName: destinationOrOriginStationName,
                                direction: direction)
    }
    
    public static func cancelButton(foregroundColor: Color? = nil, action: @escaping () -> Void) -> some CancelButtonProtocol {
        CancelButton(foregroundColor: foregroundColor, action: action)
    }
    
    public static func changesAndDurationView(numChanges: Int, duration: String, showChangesAndDurationOnly: Bool, defaultHeight: CGFloat, showJourneyDetails: Binding<Bool>) -> some ChangesAndDurationViewProtocol {
        ChangesAndDurationView(numChanges: numChanges, duration: duration, showChangesAndDurationOnly: showChangesAndDurationOnly, defaultHeight: defaultHeight, showJourneyDetails: showJourneyDetails)
    }
    
    public static func cheapestBannerView(cornersToRound: UIRectCorner) -> some CheapestBannerViewProtocol {
        CheapestBannerView(cornersToRound: cornersToRound)
    }
    
    public static func childViewWithNavigation(presentingTitle: String) -> some ChildViewWithNavigationProtocol {
        ChildViewWithNavigation(presentingTitle: presentingTitle)
    }
    
    public static func closeButtonView(onPress: (() -> Void)? = nil) -> some CloseButtonViewProtocol {
        CloseButtonView(onPress: onPress)
    }
    
    public static func customAlert(presentAlert: Binding<Bool>, title: String, message: String) -> some CustomAlertProtocol {
        CustomAlertView(presentAlert: presentAlert, title: title, message: message)
    }
    
    public static func customHorizontalDivider(color: Color, frame: CGFloat = 1.0) -> some CustomHorizontalDividerProtocol {
        CustomHorizontalDivider(color: color, frame: frame)
    }
    
    public static func customProgressView(value: Double, total: Double) -> some CustomProgressViewProtocol {
        CustomProgressView(value: value, total: total)
    }
    
    public static func directionSelectorView(selectorPresented: Binding<Bool>, selectedItem: Binding<Directions>) -> some DirectionSelectorViewProtocol {
        DirectionSelectorView(selectorPresented: selectorPresented, selectedItem: selectedItem)
    }
    
    public static func emailSentView(email: String, explanationText: String, resendEmailAction: @escaping () -> Void) -> some EmailSentViewProtocol {
        EmailSentView(email: email, explanationText: explanationText, resendEmailAction: resendEmailAction)
    }
    
    public static func emptyStationSearchBarContent(placeholderText: String, isOptionalField: Bool = false, onTap: @escaping () -> Void) -> some EmptyStationSearchBarContentProtocol {
        EmptyStationSearchBarContent(placeholderText: placeholderText, isOptionalField: isOptionalField, onTap: onTap)
    }
    
    public static func errorBanner(title: String? = nil,
                                   messages: [String],
                                   iconName: String = "CircleWarningLight",
                                   isCollapsible: Bool = false,
                                   displayMessage: Bool = false) -> some ErrorBannerProtocol {
        ErrorBanner(title: title, messages: messages, iconName: iconName, isCollapsible: isCollapsible, displayMessage: displayMessage)
    }
    
    public static func fareAdditionalInformationView(title: String, additionalDetails: [String]) -> some FareAdditionalInformationViewProtocol {
        FareAdditionalInformationView(title: title, additionalDetails: additionalDetails)
    }
    
    public static func favouriteStationCell(title: String, removalHandler: (() -> Void)? = nil) -> some FavouriteStationCellProtocol {
        FavouriteStationCell(title: title, removalHandler: removalHandler)
    }
    
    public static func flexibleLayoutHStack<Model, V>(models: [Model],
                                                      viewGenerator: @escaping (Model) -> V) -> some View where Model: Hashable, V: View {
        FlexibleLayoutHStack(models: models, viewGenerator: viewGenerator)
    }
    
    public static func floatingLabelTextField(_ title: String,
                                              text: Binding<String>, format: String? = nil,
                                              validator: Validator? = nil,
                                              isValid: Binding<Bool> = .constant(true),
                                              isSecureField: Bool = false,
                                              hideFloatingLabel: Bool = false,
                                              customValidationMessage: String = "") -> some FloatingLabelTextFieldProtocol {
        FloatingLabelTextField(title,
                               text: text,
                               format: format,
                               validator: validator,
                               isValid: isValid,
                               isSecureField: isSecureField,
                               hideFloatingLabel: hideFloatingLabel,
                               customValidationMessage: customValidationMessage         )
    }
    
    public static func genericErrorView(title: String? = nil,
                                        message: String? = nil,
                                        buttonText: String? = nil,
                                        buttonAction: (() -> Void)? = nil) -> some GenericErrorViewProtocol {
        GenericErrorView(title: title,
                         message: message,
                         buttonText: buttonText,
                         buttonAction: buttonAction)
    }
    
    public static func journeyStationsSearchBarView(placeholderText: String,
                                                    direction: Directions,
                                                    selectedStation: Binding<String>,
                                                    selectedStationCode: Binding<String>,
                                                    onTapSearchBar: @escaping () -> Void,
                                                    onResetSelection: @escaping () -> Void) -> some JourneyStationsSearchBarViewProtocol {
        JourneyStationsSearchBarView(placeholderText: placeholderText,
                                     direction: direction,
                                     selectedStation: selectedStation,
                                     selectedStationCode: selectedStationCode,
                                     onTapSearchBar: onTapSearchBar,
                                     onResetSelection: onResetSelection)
    }
    
    public static func journeyTypeSelectorView(selection: Binding<JourneyType>, journeyTypes: Binding<[JourneyType]>) -> some JourneyTypeSelectorViewProtocol {
        JourneyTypeSelectorView(selection: selection, journeyTypes: journeyTypes)
    }
    
    public static func leftTextCell(title: String, subtitle: String? = nil) -> some LeftTextCellProtocol {
        LeftTextCell(title: title, subtitle: subtitle)
    }
    
    public static func liveTrainsSkeletonView(isVisible: Binding<Bool>) -> some LiveTrainsSkeletonViewProtocol {
        LiveTrainsSkeletonView(isVisible: isVisible)
    }
    
    public static func loadingButton<Content: View>(action: @escaping () -> Void,
                                                    isLoading: Binding<Bool>,
                                                    loadingButtonStyle: LoadingButtonStyle,
                                                    @ViewBuilder builder: @escaping () -> Content) -> some View {
        LoadingButton(action: action,
                      isLoading: isLoading,
                      loadingButtonStyle: loadingButtonStyle,
                      builder: builder)
    }
    
    public static func loadMoreItemsView(text: String, imageName: String, action: @escaping () -> Void) -> some LoadMoreItemsViewProtocol {
        LoadMoreItemsView(text: text, imageName: imageName, action: action)
    }
    
    public static func navigationTitleView(primaryText: String, secondaryText: String, rightNavigationButtonAction: RightNavigationButtonAction? = nil) -> some NavigationTitleViewProtocol {
        NavigationTitleView(primaryText: primaryText, secondaryText: secondaryText, rightNavigationButtonAction: rightNavigationButtonAction)
    }
    
    public static func offlineBanner() -> some OfflineBannerProtocol {
        OfflineBanner()
    }
    
    public static func originAndDestinationView(originStationName: String,
                                                destinationStationName: String,
                                                font: Font = .tableContent2M,
                                                foregroundStyle: Color = ThemePalette.text.primary.one) -> some OriginAndDestinationViewProtocol {
        OriginAndDestinationView(originStationName: originStationName, destinationStationName: destinationStationName, font: font, foregroundStyle: foregroundStyle)
    }
    
    public static func pagerIndicatorView(numberOfPages: Int, currentPage: Binding<Int>) -> some PagerIndicatorViewProtocol {
        PagerIndicatorView(numberOfPages: numberOfPages, currentPage: currentPage)
    }
    
    public static func passengersSelectorCell(title: String,
                                              ageRangeText: String,
                                              maxValue: Int,
                                              disableAddButton: Bool,
                                              value: Binding<Int>) -> some PassengersSelectorCellProtocol {
        PassengersSelectorCell(title: title, ageRangeText: ageRangeText, maxValue: maxValue, disableAddButton: disableAddButton, value: value)
    }
    
    public static func paymentDetailsRow(title: String, value: String) -> some PaymentDetailsRowProtocol {
        PaymentDetailsRow(title: title, value: value)
    }
    
    public static func priceText(price: Float,
                                 currency: String,
                                 isSmallFont: Bool = true) -> some PriceTextProtocol {
        PriceText(price: price, currency: currency, isSmallFont: isSmallFont)
    }
    
    public static func radioButtonView(index: Int,
                                       text: String,
                                       description: String,
                                       selectedIndex: Binding<Int>) -> some RadioButtonViewProtocol {
        RadioButtonView(index: index, text: text, description: description, selectedIndex: selectedIndex)
    }
    
    public static func realTimeLabel(trainStatus: TrainStatus,
                                     scheduledTime: String,
                                     realTime: String? = nil) -> some RealTimeLabelProtocol {
        RealTimeLabel(trainStatus: trainStatus, scheduledTime: scheduledTime, realTime: realTime)
    }
    
    public static func resultsSearchBarView(searchText: Binding<String>) -> some ResultsSearchBarViewProtocol {
        ResultsSearchBarView(searchText: searchText)
    }
    
    public static func roundedCorner(radius: CGFloat, corners: UIRectCorner) -> some Shape {
        RoundedCorner(radius: radius, corners: corners)
    }
    
    public static func safariWebView(url: URL) -> some SafariWebViewProtocol {
        SafariWebView(url: url)
    }
    
    public static func scheduleTimeLabel(trainStatus: TrainStatus, scheduledTime: String) -> some ScheduleTimeLabelProtocol {
        ScheduleTimeLabel(trainStatus: trainStatus, scheduledTime: scheduledTime)
    }
    
    public static func searchDateComponent(dateSelection: Binding<Int?> = .constant(nil),
                                           selectedDate: Binding<Date>,
                                           selectedReturnDate: Binding<Date>,
                                           directionSelected: Binding<Directions>,
                                           directionSelectorPresented: Binding<Bool>,
                                           returnDirectionSelected: Binding<Directions>,
                                           journeyType: JourneyType) -> some SearchDateComponentProtocol {
        SearchDateComponent(dateSelection: dateSelection, selectedDate: selectedDate, selectedReturnDate: selectedReturnDate, directionSelected: directionSelected, directionSelectorPresented: directionSelectorPresented, returnDirectionSelected: returnDirectionSelected, journeyType: journeyType)
    }
    
    public static func selectedStationSearchBarContent(directionText: String,
                                                       selectedStation: String,
                                                       selectedStationCode: String,
                                                       onTap: @escaping () -> Void,
                                                       onReset: @escaping () -> Void) -> some SelectedStationSearchBarContentProtocol {
        SelectedStationSearchBarContent(directionText: directionText, selectedStation: selectedStation, selectedStationCode: selectedStationCode, onTap: onTap, onReset: onReset)
    }
    
    public static func selectionRow(title: String, isSelected: Bool) -> some SelectionRowProtocol {
        SelectionRow(title: title, isSelected: isSelected)
    }
    
    public static func shoppingLegSolutionJourneyAttributesView(journeyWarningKind: JourneyWarningKind? = nil,
                                                                representsFastestJourney: Bool) -> some ShoppingLegSolutionJourneyAttributesViewProtocol {
        ShoppingLegSolutionJourneyAttributesView(journeyWarningKind: journeyWarningKind, representsFastestJourney: representsFastestJourney)
    }
    
    public static func summaryFooterView(price: Float, currency: String) -> some SummaryFooterViewProtocol {
        SummaryFooterView(price: price, currency: currency)
    }
    
    public static func termsAndConditionsView() -> some TermsAndConditionsViewProtocol {
        TermsAndConditionsScreen()
    }
    
    public static func ticketDetailsDisclosureLabel(title: String,
                                                    totalPrice: String,
                                                    detailsShown: Binding<Bool>) -> some TicketDetailsDisclosureLabelProtocol {
        TicketDetailsDisclosureLabel(title: title, totalPrice: totalPrice, detailsShown: detailsShown)
    }
    
    public static func ticketDivider() -> some TicketDividerProtocol {
        TicketDivider()
    }
    
    public static func timeAndStatusView(status: TrainStatus,
                                         time: String,
                                         actualTime: String?,
                                         alignment: HorizontalAlignment) -> some TimeAndStatusViewProtocol {
        TimeAndStatusView(status: status, time: time, actualTime: actualTime, alignment: alignment)
    }
    
    public static func trainStatusLabel(trainStatus: TrainStatus) -> some TrainStatusLabelProtocol {
        TrainStatusLabel(trainStatus: trainStatus)
    }
}
