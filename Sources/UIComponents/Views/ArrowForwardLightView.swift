import SwiftUI
import UIComponentsProtocols

public struct ArrowForwardLightView: View, ArrowForwardLightViewProtocol {

    let imageHeight = 13.0
    @State var color: Color

    public init(color: Color) {
        self.color = color
    }

    public var body: some View {
        Image("ArrowForwardLight", bundle: UIComponents.bundle)
            .resizable()
            .foregroundStyle(color)
            .frame(width: imageHeight / 2, height: imageHeight)
    }
}

struct ArrowForwardLightView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowForwardLightView(color: Color.green)
    }
}
