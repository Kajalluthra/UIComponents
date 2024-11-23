import SwiftUI
import Inject
import UIComponentsProtocols

public struct RadioButtonView: View, RadioButtonViewProtocol {

    let index: Int
    let text: String
    let description: String
    @Binding var selectedIndex: Int
    @ObserveInjection var inject

    public init(index: Int,
                text: String,
                description: String,
                selectedIndex: Binding<Int>) {
        self.index = index
        self.text = text
        self.description = description
        self._selectedIndex = selectedIndex
    }

    private var isOn: Bool {
        return selectedIndex == index
    }

    public var body: some View {
        Button {
            selectedIndex = index
        } label: {
            VStack(alignment: .leading, spacing: defaultPadding / 2) {
                HStack {
                    Text(text)
                        .font(.header4Light)
                        .frame(alignment: .leading)
                    Spacer()
                    Circle()
                        .fill(isOn ? ThemePalette.icons.universal.mid : Color.clear)
                        .overlay(Circle().stroke(ThemePalette.icons.universal.mid, lineWidth: 2).padding(-4))
                        .frame(width: 18, height: 18)
                }
                if isOn {
                    Text(description)
                        .font(.paragraphP2Light)
                        .frame(maxHeight: .infinity, alignment: .leading)
                }
            }
            .foregroundStyle(ThemePalette.text.primary.one)
            .contentShape(Rectangle())
            .padding(defaultPadding / 2)
            .background(isOn ? ThemePalette.base.theme.primaryBackground : .clear)
            .cornerRadius(4)
        }
        .buttonStyle(RadioButtonStyle())
        .enableInjection()
    }
}

struct RadioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonView(index: 0, text: "eTicket", description: "Use in-app in your Apple wallet or print at home", selectedIndex: .constant(0))
            .setupUIComponents()
    }
}
