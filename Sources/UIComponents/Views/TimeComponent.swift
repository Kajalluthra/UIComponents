import SwiftUI
import Inject

struct TimeComponent: View {

    var text: String
    @ObserveInjection var inject

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(.paragraphP3Medium)
            .foregroundStyle(ThemePalette.text.primary.one)
            .frame(width: 83, height: 48)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(ThemePalette.base.containerStroke.success, lineWidth: 1)
            )
            .contentShape(Rectangle())
            .enableInjection()
    }
}

struct TimeComponent_Previews: PreviewProvider {
    static var previews: some View {
        TimeComponent(text: "12")
            .setupUIComponents()
    }
}
