import SwiftUI
import Core
import Inject
import UIComponentsProtocols

public struct DirectionSelectorView: View, DirectionSelectorViewProtocol {

    @Binding var selectorPresented: Bool
    @Binding var selectedItem: Directions
    let rowPadding = 4.0
    @ObserveInjection var inject

    public init(selectorPresented: Binding<Bool>,
         selectedItem: Binding<Directions>) {
        self._selectorPresented = selectorPresented
        self._selectedItem = selectedItem
    }
    
    public var body: some View {
        let directions = Directions.allCases
        if selectorPresented {
            VStack(spacing: -rowPadding) {
                ForEach(directions, id: \.self) { direction in
                    SelectionRow(title: direction.getText(), isSelected: selectedItem == direction)
                        .padding(rowPadding)
                        .onTapGesture {
                            selectedItem = direction
                            selectorPresented = false
                        }
                }
            }
            .frame(maxWidth: .infinity, minHeight: 120)
            .background(ThemePalette.base.containerFill.primary)
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(ThemePalette.base.containerStroke.focus, lineWidth: 1)
            )
            .enableInjection()
        }

    }
}

struct DirectionSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionSelectorView(selectorPresented: .constant(true), selectedItem: .constant(.departing))
            .setupUIComponents()
    }
}
