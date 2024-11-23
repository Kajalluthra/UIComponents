import SwiftUI
import Core
import Inject
import UIComponentsProtocols
 
struct DateSelectComponent: View, DateSelectComponentProtocol{
    
    enum DayComponent: String, CaseIterable {
        case today
        case tomorrow
        
        func getText() -> String {
            switch self {
            case .today:
                return "search.date.component.today".localized
            case .tomorrow:
                return "search.date.component.tomorrow".localized
            }
        }
    }
    
    @Binding var selectedIndex: Int?
    @Binding var selectedDate: Date
    @Binding var directionSelected: Directions
    @Binding var showDateAndTimeSelector: Bool
    @State var selectedDateString: String = ""
    @ObserveInjection var inject
    
    init(selectedIndex: Binding<Int?> = .constant(nil),
                selectedDate: Binding<Date>,
                directionSelected: Binding<Directions>,
                showDateAndTimeSelector: Binding<Bool>,
                selectedDateString: String = "") {
        self._selectedIndex = selectedIndex
        self._selectedDate = selectedDate
        self._directionSelected = directionSelected
        self._showDateAndTimeSelector = showDateAndTimeSelector
        self.selectedDateString = selectedDateString
    }
    
    var body: some View {
        HStack {
            Text("search.date.component.title".localized)
                .font(.tableTitle2SemiBold)
                .foregroundStyle(ThemePalette.text.primary.one)
            Spacer()
            
            if selectedDateString.isEmpty {
                let dayComponents = DayComponent.allCases
                ForEach(0 ..< dayComponents.count, id: \.self) { index in
                    Text(dayComponents[index].getText())
                        .font(selectedIndex == index ? .paragraphP3Medium : .paragraphP3Light)
                        .foregroundStyle(selectedIndex == index ? ThemePalette.text.function.success : ThemePalette.text.primary.three)
                        .onTapGesture {
                            selectedIndex = index
                            let tomorrowDate = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
                            selectedDate = index == 0 ? Date() : tomorrowDate.nearestQuarter
                        }
                }
            }
            
            Text(selectedDateString.isEmpty ? "select.button".localized : selectedDateString)
                .font(.paragraphP3Light)
                .foregroundStyle(ThemePalette.text.primary.one)
                .onTapGesture {
                    showDateAndTimeSelector.toggle()
                }
            ArrowForwardLightView(color: ThemePalette.icons.universal.brand)
        }
        .padding([.top, .bottom], defaultPadding / 2)
        .onChange(of: selectedDate) { _ in
            updateDateString()
        }
        .onAppear {
            updateDateString()
        }
        .enableInjection()
    }
    
    private func updateDateString() {
        let calendar = Calendar(identifier: .gregorian)
        if calendar.isDateInToday(selectedDate) {
            selectedIndex = 0
            selectedDateString = ""
        } else if calendar.isDateInTomorrow(selectedDate) {
            selectedIndex = 1
            selectedDateString = ""
        } else {
            let date = DateFormatter.getDayAndMonthFormatter().string(from: selectedDate).capitalized
            selectedDateString = date
        }
    }
}

struct DateSelectComponent_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 50) {
            DateSelectComponent(selectedIndex: .constant(0), selectedDate: .constant(Date()), directionSelected: .constant(.departing), showDateAndTimeSelector: .constant(false))
            
            DateSelectComponent(selectedIndex: .constant(1), selectedDate: .constant(Date()), directionSelected: .constant(.departing), showDateAndTimeSelector: .constant(false))
            
        }
        .setupUIComponents()
    }
}
