import SwiftUI
import Inject
import Core

struct TimeSelector: View {

    @Binding var showDateAndTimeSelector: Bool
    @Binding var selectedTime: Date
    @ObserveInjection var inject

    init(showDateAndTimeSelector: Binding<Bool>,
                selectedTime: Binding<Date>) {
        self._showDateAndTimeSelector = showDateAndTimeSelector
        self._selectedTime = selectedTime
    }

    var body: some View {
        HStack(spacing: 16) {
            TimeComponent(text: DateFormatter.getHoursFormatter().string(from: selectedTime.nearestQuarter))
            TimeComponent(text: DateFormatter.getMinutesFormatter().string(from: selectedTime.nearestQuarter))
        }
        .onTapGesture {
            showDateAndTimeSelector.toggle()
        }
        .enableInjection()
    }
}

struct TimeSelector_Previews: PreviewProvider {
    static var previews: some View {
        TimeSelector(showDateAndTimeSelector: .constant(false), selectedTime: .constant(Date()))
            .setupUIComponents()
    }
}
