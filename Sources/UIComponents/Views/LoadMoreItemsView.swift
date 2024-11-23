import SwiftUI
import UIComponentsProtocols

public struct LoadMoreItemsView: View, LoadMoreItemsViewProtocol {

    let text: String
    let imageName: String
    let action: () -> Void

    public init(text: String, imageName: String, action: @escaping () -> Void) {
        self.text = text
        self.imageName = imageName
        self.action = action
    }

    public var body: some View {
        Button(action: action, label: {
            HStack {
                Text(text)
                Image(imageName, bundle: UIComponents.bundle)
                    .foregroundStyle(ThemePalette.icons.universal.brand)
            }
        })
        .padding(.vertical, defaultPadding)
        .buttonStyle(MaterTertiaryButtonStyle())
        .fixedSize()
    }
}

struct LoadMoreItems_Previews: PreviewProvider {
    static var previews: some View {
        LoadMoreItemsView(text: "Load", imageName: "EarlierArrowLight", action: {})
            .setupUIComponents()
    }
    
}
