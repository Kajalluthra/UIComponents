import SwiftUI
import UIComponentsProtocols

public struct CloseButtonView: View, CloseButtonViewProtocol {

    @Environment(\.presentationMode) var presentationMode
    private var onPress: (() -> Void)?

    public init(onPress: (() -> Void)? = nil) {
        self.onPress = onPress
    }

    public var body: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
            guard let onPress = onPress else { return }
            onPress()
        } label: {
            HStack {
                Image("CircleCloseLight", bundle: UIComponents.bundle)
                    .foregroundStyle(ThemePalette.icons.universal.strong)
                Text("close.text".localized)
                    .font(.buttonT4)
            }
            .foregroundStyle(ThemePalette.text.primary.one)
        }
    }
}

#Preview {
    CloseButtonView(onPress: nil)
        .setupUIComponents()
}
