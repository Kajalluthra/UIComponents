import SwiftUI
import Core
import Inject
import UIComponentsProtocols

public struct SearchDateComponent: View, SearchDateComponentProtocol {
    
    @Binding var dateSelection: Int?
    @Binding var selectedDate: Date
    @Binding var selectedReturnDate: Date
    @Binding var directionSelected: Directions
    @Binding var directionSelectorPresented: Bool
    @Binding var returnDirectionSelected: Directions
    let journeyType: JourneyType
    
    @ObserveInjection var inject
    
    public init(dateSelection: Binding<Int?> = .constant(nil),
                selectedDate: Binding<Date>,
                selectedReturnDate: Binding<Date>,
                directionSelected: Binding<Directions>,
                directionSelectorPresented: Binding<Bool>,
                returnDirectionSelected: Binding<Directions>,
                journeyType: JourneyType) {
        self._dateSelection = dateSelection
        self._selectedDate = selectedDate
        self._selectedReturnDate = selectedReturnDate
        self._directionSelected = directionSelected
        self._directionSelectorPresented = directionSelectorPresented
        self._returnDirectionSelected = returnDirectionSelected
        self.journeyType = journeyType
    }
    
    public var body: some View {
        VStack {
            if journeyType == .single || journeyType == .openReturn {
                SearchDateSingleTripView(dateSelection: $dateSelection, selectedDate: $selectedDate, directionSelected: $directionSelected, directionSelectorPresented: $directionSelectorPresented)
            } else if journeyType == .returnJourney {
                SearchDateCell(selectedDate: $selectedDate, directionSelected: $directionSelected, referenceDate: Date(), tripDirection: .outboundDirection)
                CustomHorizontalDivider(color: ThemePalette.base.theme.primaryBackground)
                SearchDateCell(selectedDate: $selectedReturnDate, directionSelected: $returnDirectionSelected, referenceDate: selectedDate, tripDirection: .returnDirection)
            }
        }
        .onChange(of: selectedDate) { _ in
            selectedReturnDate = selectedDate.addingTimeInterval(60 * 60)
        }
        .enableInjection()
    }
}

struct SearchDateComponent_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 50) {
            SearchDateComponent(dateSelection: .constant(0),
                                selectedDate: .constant(Date()),
                                selectedReturnDate: .constant(Date().addingTimeInterval(60 * 60)),
                                directionSelected: .constant(.departing),
                                directionSelectorPresented: .constant(false),
                                returnDirectionSelected: .constant(.departing),
                                journeyType: .single)
            
            SearchDateComponent(dateSelection: .constant(0),
                                selectedDate: .constant(Date()),
                                selectedReturnDate: .constant(Date().addingTimeInterval(60 * 60)),
                                directionSelected: .constant(.departing),
                                directionSelectorPresented: .constant(false),
                                returnDirectionSelected: .constant(.departing),
                                journeyType: .openReturn)
            
            SearchDateComponent(dateSelection: .constant(0),
                                selectedDate: .constant(Date()),
                                selectedReturnDate: .constant(Date().addingTimeInterval(60 * 60)),
                                directionSelected: .constant(.departing),
                                directionSelectorPresented: .constant(false),
                                returnDirectionSelected: .constant(.departing),
                                journeyType: .returnJourney)
        }
        .setupUIComponents()
    }
}
