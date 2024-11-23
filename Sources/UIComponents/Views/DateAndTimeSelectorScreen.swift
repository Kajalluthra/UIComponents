import SwiftUI
import Core
import Inject
import UIComponentsProtocols

struct DateAndTimeSelectorScreen: View, DateAndTimeSelectorViewProtocol {
    
    @EnvironmentObject var statusBarConfigurator: StatusBarConfigurator
    @Binding var isViewPresented: Bool
    @Binding var directionSelected: Directions
    @Binding var dateSelectedIndex: Int?
    @Binding var dateSelected: Date
    @State var directionSelectedIndex: Int = 0
    @State var currentDateSelectedIndex: Int = 0
    @State var currentDateSelected: Date = Date()
    let referenceDate: Date
    let tripDirection: TripDirection
    @ObserveInjection var inject
    
    init(isViewPresented: Binding<Bool>,
                directionSelected: Binding<Directions>,
                dateSelectedIndex: Binding<Int?> = .constant(nil),
                dateSelected: Binding<Date>,
                referenceDate: Date,
         tripDirection: TripDirection) {
        self._isViewPresented = isViewPresented
        self._directionSelected = directionSelected
        self._dateSelectedIndex = dateSelectedIndex
        self._dateSelected = dateSelected
        self.referenceDate = referenceDate
        self.tripDirection = tripDirection
    }
    
    var body: some View {
        ThemePalette.base.theme.primaryBackground
            .ignoresSafeArea()
            .overlay(
                VStack(spacing: 0) {
                    HStack(alignment: .center) {
                        let title = tripDirection == .outboundDirection ? "outbound.journey.title".localized : "return.journey.title".localized
                        Text(title)
                            .font(.header4SemiBold)
                            .foregroundStyle(ThemePalette.text.primary.two)
                        CancelButton {
                            statusBarConfigurator.statusBarStyle = .lightContent
                            isViewPresented = false
                        }
                    }
                    .padding(16)
                    .frame(alignment: .top)
                    
                    ThemePalette.base.theme.appSecondaryBackgroundTwo
                        .edgesIgnoringSafeArea(.all)
                        .overlay(
                            VStack {
                                RoundedSegmentedControl(selectedIndex: $directionSelectedIndex,
                                                        options: [Directions.departing.getText(), Directions.arriving.getText()],
                                                        style: .lightPrimary)
                                .padding()
                                DatePicker("", selection: $currentDateSelected, in: referenceDate.nearestQuarter...)
                                    .datePickerStyle(.wheel)
                                    .labelsHidden()
                                    .onChange(of: currentDateSelected) { newValue in
                                        currentDateSelectedIndex = getCorrespondingDateSelectedIndex()
                                    }
                                    .onAppear {
                                        UIDatePicker.appearance().minuteInterval = 15
                                    }
                                    .tint(ThemePalette.text.primary.one)
                                    .font(.buttonT1)
                                RoundedSegmentedControl(selectedIndex: $currentDateSelectedIndex,
                                                        options: [DateSelectComponent.DayComponent.today.getText(), DateSelectComponent.DayComponent.tomorrow.getText()],
                                                        style: .lightPrimary)
                                .onChange(of: currentDateSelectedIndex, perform: { newValue in
                                    if newValue == 0 {
                                        let dateToSelect = Date().nearestQuarter
                                        updateDateSelectionIfPossible(dateToSelect)
                                    } else if newValue == 1 {
                                        var dateToSelect: Date
                                        if Calendar.current.isDateInTomorrow(dateSelected) {
                                            dateToSelect = dateSelected
                                        } else {
                                            dateToSelect = Calendar.current.date(byAdding: .day, value: 1, to: Date().nearestQuarter) ?? Date().nearestQuarter
                                        }
                                        updateDateSelectionIfPossible(dateToSelect)
                                    }
                                })
                                .padding()
                                Spacer()
                                Button {
                                    directionSelected = Directions.allCases[directionSelectedIndex]
                                    dateSelected = currentDateSelected
                                    dateSelectedIndex = currentDateSelectedIndex
                                    statusBarConfigurator.statusBarStyle = .lightContent
                                    isViewPresented = false
                                } label: {
                                    Text("done.button".localized)
                                }
                                .buttonStyle(SecondaryDarkButtonStyle())
                            }
                        )
                }
            )
            .onAppear {
                statusBarConfigurator.statusBarStyle = .darkContent
                directionSelectedIndex = directionSelected.index ?? 0
                currentDateSelectedIndex = dateSelectedIndex ?? 0
                currentDateSelected = $dateSelected.wrappedValue
            }
            .trackScreen("DateAndTimeSelectorScreen")
            .enableInjection()
    }
    
    private func getCorrespondingDateSelectedIndex() -> Int {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "en_EN")
        if calendar.isDateInToday(currentDateSelected) {
            return 0
        } else if calendar.isDateInTomorrow(currentDateSelected) {
            return 1
        } else {
            return -1
        }
    }
    
    private func updateDateSelectionIfPossible(_ dateToSelect: Date) {
        let previousDateSelectedIndex = getCorrespondingDateSelectedIndex()
        if dateToSelect >= referenceDate {
            currentDateSelected = dateToSelect
        } else {
            currentDateSelectedIndex = previousDateSelectedIndex
        }
    }
}

struct DateAndTimeSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        DateAndTimeSelectorScreen(isViewPresented: .constant(false),
                                directionSelected: .constant(.departing),
                                dateSelectedIndex: .constant(0),
                                dateSelected: .constant(Date()),
                                referenceDate: Date(),
                                tripDirection: .outboundDirection)
        .environmentObject(StatusBarConfigurator())
        .setupUIComponents()
    }
}
