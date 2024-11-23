import SwiftUI

public struct WalletButtonStyle: ButtonStyle {
    
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        WalletButtonStyleView(configuration: configuration)
    }
}

private extension WalletButtonStyle {
    struct WalletButtonStyleView: View {
        @Environment(\.isEnabled) var isEnabled
        let configuration: WalletButtonStyle.Configuration
        
        var body: some View {
            configuration.label
                .padding()
                .foregroundStyle(isEnabled ? .white : ThemePalette.text.function.disabled)
                .font(.system(size: 17, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: 48)
                .background(Color.black)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                .cornerRadius(8)
                .padding()
        }
    }
}
