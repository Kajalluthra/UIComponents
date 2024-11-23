import SwiftUI
import Inject
import UIComponentsProtocols

public struct ResultsSearchBarView: View, ResultsSearchBarViewProtocol {

    @Binding var searchText: String
    @State private var editing = true

    @ObserveInjection var inject

    public init(searchText: Binding<String>) {
        self._searchText = searchText
    }

    public var body: some View {
        HStack {
            FirstResponderTextField(text: $searchText, editing: $editing)
            .disableAutocorrection(true)
            .padding([.horizontal], defaultPadding)
            .background(ThemePalette.base.containerFill.forms)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(editing ? ThemePalette.base.containerStroke.focus : ThemePalette.base.containerStroke.forms, lineWidth: 1)
                    .shadow(color: editing ? ThemePalette.base.containerStroke.focus : Color.clear, radius: 2, x: 0, y: 0)
            )
        }
        .frame(height: 56)
        .padding(defaultPadding)
        .enableInjection()
    }
}

struct ResultsSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsSearchBarView(searchText: .constant(""))
            .setupUIComponents()
    }
}
