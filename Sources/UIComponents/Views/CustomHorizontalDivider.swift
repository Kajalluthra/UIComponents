import SwiftUI
import UIComponentsProtocols

public struct CustomHorizontalDivider: View, CustomHorizontalDividerProtocol {

    var color: Color
    var frame: CGFloat

    public init(color: Color, frame: CGFloat = 1.0) {
        self.color = color
        self.frame = frame
    }

    public var body: some View {
        color.frame(height: frame)
    }
}

struct CustomHorizontalDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomHorizontalDivider(color: .red)
    }
}
