import SwiftUI

public struct YellowCapsuleButtonStyle: ButtonStyle {

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        YellowCapsuleButtonStyleView(configuration: configuration)
    }
}

private extension YellowCapsuleButtonStyle {
    struct YellowCapsuleButtonStyleView: View {
        @Environment(\.isEnabled) var isEnabled
        let configuration: YellowCapsuleButtonStyle.Configuration

        var body: some View {
            if let paypalForeground = UIColor(hexString: "#253B80"), let paypalBackground = UIColor(hexString: "#FFD140") {
                configuration.label
                    .padding()
                    .foregroundStyle(isEnabled ? Color(paypalForeground) : Color(paypalForeground).opacity(0.4))
                    .font(.buttonT1)
                    .frame(maxWidth: .infinity, maxHeight: 48)
                    .background(isEnabled ? Color(paypalBackground) : Color(paypalBackground).opacity(0.4))
                    .opacity(configuration.isPressed ? 0.8 : 1.0)
                    .clipShape(Capsule())
                    .padding()
            }
        }
    }
}
