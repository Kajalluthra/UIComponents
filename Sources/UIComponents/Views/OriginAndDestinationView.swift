import SwiftUI
import Inject
import UIComponentsProtocols

public struct OriginAndDestinationView: View, OriginAndDestinationViewProtocol {

    let originStationName: String
    let destinationStationName: String
    let font: Font
    let foregroundStyle: Color
    @ObserveInjection var inject

    public init(originStationName: String,
                destinationStationName: String,
                font: Font = .tableContent2M,
                foregroundStyle: Color = ThemePalette.text.primary.one) {
        self.originStationName = originStationName
        self.destinationStationName = destinationStationName
        self.font = font
        self.foregroundStyle = foregroundStyle
    }

    public var body: some View {
        (Text(originStationName + " ") +
         Text(Image(systemName: "arrow.right")).foregroundColor(ThemePalette.text.primary.three) +
         Text(" " + destinationStationName))
        .font(font)
        .padding([.leading, .trailing], defaultPadding)
        .foregroundStyle(foregroundStyle)
        .enableInjection()
    }
}

struct OriginAndDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        OriginAndDestinationView(originStationName: "London", destinationStationName: "Birmingham")
            .setupUIComponents()
    }
}
