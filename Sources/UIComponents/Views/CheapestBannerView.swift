import SwiftUI
import Inject
import UIComponentsProtocols

public struct CheapestBannerView: View, CheapestBannerViewProtocol {

    let cheapestBannerHeight = 14.0
    let cornersToRound: UIRectCorner
    @ObserveInjection var inject

    public init(cornersToRound: UIRectCorner) {
        self.cornersToRound = cornersToRound
    }

    public var body: some View {
        Text("cheapest.text".localized)
            .font(.buttonT3)
            .foregroundStyle(ThemePalette.spotColours.cheapestBanner.text)
            .frame(maxWidth: .infinity)
            .background(
                Rectangle()
                    .stroke(ThemePalette.spotColours.cheapestBanner.stroke, lineWidth: 1)
                    .background(ThemePalette.spotColours.cheapestBanner.fill)
                    .frame(height: cheapestBannerHeight)
                    .cornerRadius(4, corners: cornersToRound)
            )
            .padding(.top, -defaultPadding / 8)
            .enableInjection()
    }
}

struct CheapestBannerView_Previews: PreviewProvider {
    static var previews: some View {
        CheapestBannerView(cornersToRound: [.bottomLeft, .topRight])
            .setupUIComponents()
    }
}
