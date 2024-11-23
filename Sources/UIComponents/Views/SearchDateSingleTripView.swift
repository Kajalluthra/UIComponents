import SwiftUI
import Core
import Inject

struct SearchDateSingleTripView: View {
    @Binding var dateSelection: Int?
    @Binding var selectedDate: Date
    @Binding var directionSelected: Directions
    @Binding var directionSelectorPresented: Bool
    @State var showDateAndTimeSelector: Bool = false

    @ObserveInjection var inject

    var body: some View {
        VStack {
            DateSelectComponent(selectedIndex: $dateSelection, selectedDate: $selectedDate, directionSelected: $directionSelected, showDateAndTimeSelector: $showDateAndTimeSelector)
            CustomHorizontalDivider(color: ThemePalette.base.theme.primaryBackground)
            HStack {
                DirectionComponent(selectorPresented: $directionSelectorPresented, directionSelected: $directionSelected)
                Spacer()
                TimeSelector(showDateAndTimeSelector: $showDateAndTimeSelector, selectedTime: $selectedDate)
            }
        }
        .fullScreenCover(isPresented: $showDateAndTimeSelector, content: {
            DateAndTimeSelectorScreen(isViewPresented: $showDateAndTimeSelector,
                                    directionSelected: $directionSelected,
                                    dateSelectedIndex: $dateSelection,
                                    dateSelected: $selectedDate,
                                    referenceDate: Date(),
                                    tripDirection: .outboundDirection)
        })
        .enableInjection()
    }
}

struct SearchDateSingleTripView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 50) {
            SearchDateSingleTripView(dateSelection: .constant(0), selectedDate: .constant(Date()), directionSelected: .constant(.departing), directionSelectorPresented: .constant(false))

            SearchDateSingleTripView(dateSelection: .constant(1), selectedDate: .constant(Date()), directionSelected: .constant(.arriving), directionSelectorPresented: .constant(false))
        }
        .setupUIComponents()
    }
}
