import SwiftUI
import Inject
import UIComponentsProtocols

public struct FavouriteStationCell: View, FavouriteStationCellProtocol {

    let title: String
    let removalHandler: (() -> Void)?
    @ObserveInjection var inject

    private let cornerRadius = 8.0
    private let imageHeight = 20.0

    public init(title: String, 
                removalHandler: (() -> Void)? = nil) {
        self.title = title
        self.removalHandler = removalHandler
    }

    public var body: some View {
        VStack {
            if let removalHandler {
                HStack {
                    Spacer()
                    Button(action: removalHandler) {
                        HStack {
                            Text("remove.station.button".localized)
                                .foregroundStyle(ThemePalette.text.secondary.one)
                                .font(.buttonT4)
                            Image("CircleRemoveLight", bundle: UIComponents.bundle)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(ThemePalette.icons.universal.strongReverse)
                        }
                    }
                }
                .padding(.horizontal, defaultPadding)
            }
            HStack {
                Text(title)
                    .font(.display7)
                    .foregroundStyle(ThemePalette.text.primary.one)
                Spacer()
                Image("ArrowForwardBold", bundle: UIComponents.bundle)
                    .resizable()
                    .foregroundStyle(ThemePalette.icons.universal.brand)
                    .scaledToFill()
                    .frame(width: imageHeight / 2, height: imageHeight)
            }
            .padding(defaultPadding)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(ThemePalette.base.containerStroke.defaultStroke)
                    .background(ThemePalette.base.containerFill.primary)
                    .cornerRadius(cornerRadius)
            )
            .enableInjection()
        }
    }
}

struct FavouriteStationCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FavouriteStationCell(title: "Station name", removalHandler: nil)
                .previewDisplayName("Without Removal Handler")
            FavouriteStationCell(title: "Station name", removalHandler: {})
                .previewDisplayName("With Removal Handler")
        }
        .background(Color(UIColor(hexString: "#194245")!))
        .setupUIComponents()
    }
}
