import Foundation
import SwiftUI

public struct CustomPickerStyle: ViewModifier {
    var labelText: String

    public func body(content: Content) -> some View {
        Menu {
            content
        } label: {
            HStack {
                Text(labelText)
                    .font(.paragraphP3Medium)
                Spacer()
                Image("ArrowDownLight", bundle: UIComponents.bundle)
                    .foregroundStyle(ThemePalette.icons.universal.brand)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(ThemePalette.base.containerFill.forms)
        }
    }
}
