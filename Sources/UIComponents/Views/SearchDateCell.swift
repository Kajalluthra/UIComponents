import SwiftUI
import Core
import Inject
import UIComponentsProtocols

struct SearchDateCell: View {
    
    @Binding var selectedDate: Date
    @Binding var directionSelected: Directions
    @State var showDateAndTimeSelector: Bool = false
    let referenceDate: Date
    let tripDirection: TripDirection
    @ObserveInjection var inject
    
    init(selectedDate: Binding<Date>,
                directionSelected: Binding<Directions>,
                referenceDate: Date,
                tripDirection: TripDirection) {
        self._selectedDate = selectedDate
        self._directionSelected = directionSelected
        self.referenceDate = referenceDate
        self.tripDirection = tripDirection
    }
    
    var body: some View {
        HStack {
            Text(tripDirection.getText())
                .font(.tableTitle2SemiBold)
                .foregroundStyle(ThemePalette.text.primary.one)
            Spacer()
            VStack(alignment: .trailing) {
                if directionSelected == .arriving {
                    Text(directionSelected.getText())
                        .font(.label4M)
                        .foregroundStyle(ThemePalette.text.primary.three)
                        .padding([.top], -defaultPadding)
                }
                Text(getDateText())
                    .font(.paragraphP3Light)
                    .foregroundStyle(ThemePalette.text.primary.one)
            }
            .frame(alignment: .top)
            ArrowForwardLightView(color: ThemePalette.icons.universal.brand)
        }
        .padding([.top, .bottom], defaultPadding / 2)
        .contentShape(Rectangle())
        .onTapGesture {
            showDateAndTimeSelector = true
        }
        .fullScreenCover(isPresented: $showDateAndTimeSelector, content: {
            DateAndTimeSelectorScreen(isViewPresented: $showDateAndTimeSelector,
                                    directionSelected: $directionSelected,
                                    dateSelectedIndex: .constant(nil),
                                    dateSelected: $selectedDate,
                                    referenceDate: referenceDate,
                                    tripDirection: tripDirection)
        })
        .enableInjection()
    }
    
    private func getDateText() -> String {
        var day: String
        if Calendar.current.isDateInToday(selectedDate) {
            day = "search.date.component.today".localized
        } else if Calendar.current.isDateInTomorrow(selectedDate) {
            day = "search.date.component.tomorrow".localized
        } else {
            day = DateFormatter.getDayAndMonthFormatter().string(from: selectedDate).capitalized
        }
        let time = DateFormatter.getHourAndMinutesFormatter().string(from: selectedDate.nearestQuarter)
        return "\(day), \(time)"
    }
}

struct SearchDateCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 30) {
            SearchDateCell(selectedDate: .constant(Date()), directionSelected: .constant(.departing), referenceDate: Date(), tripDirection: .outboundDirection)
            SearchDateCell(selectedDate: .constant(Date()), directionSelected: .constant(.arriving), referenceDate: Date(), tripDirection: .returnDirection)
        }
        .setupUIComponents()
    }
}
