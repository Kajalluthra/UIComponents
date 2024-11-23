import SwiftUI
import Inject
import UIComponentsProtocols

public struct BannerBackground: View, BannerBackgroundProtocol {

    let lineColor: Color
    @ObserveInjection var inject

    public init(lineColor: Color) {
        self.lineColor = lineColor
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            lineColor
                .cornerRadius(4)
            ThemePalette.base.containerFill.important
                .cornerRadius(4, corners: [.topRight, .bottomRight])
                .padding([.leading], 8)
            RoundedRectangle(cornerRadius: 4)
                .stroke(lineColor, lineWidth: 1)
        }
        .enableInjection()
    }
}

struct BannerBackground_Previews: PreviewProvider {
    static var previews: some View {
        BannerBackground(lineColor: Color.red)
            .setupUIComponents()
    }
}
