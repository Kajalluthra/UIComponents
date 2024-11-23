import SwiftUI
import PassKit
import Inject
import UIComponentsProtocols

public struct ApplePayButton: View, ApplePayButtonProtocol {

    var action: () -> Void
    let buttonHeight: CGFloat = 48.0
    @ObserveInjection var inject

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    public var body: some View {
        ApplePayButtonRepresentable(action: action)
            .frame(height: buttonHeight)
            .frame(maxWidth: .infinity)
            .clipShape(Capsule())
            .padding(defaultPadding)
            .enableInjection()
    }
}

struct ApplePayButton_Previews: PreviewProvider {
    static var previews: some View {
        ApplePayButton(action: {})
    }
}

extension ApplePayButton {
    struct ApplePayButtonRepresentable: UIViewRepresentable {
        var action: () -> Void

        func makeCoordinator() -> Coordinator {
            Coordinator(action: action)
        }

        func makeUIView(context: Context) -> some UIView {
            context.coordinator.button
        }

        func updateUIView(_ uiView: UIViewType, context: Context) {
            context.coordinator.action = action
        }
    }

    class Coordinator: NSObject {
        var action: () -> Void
        let button = PKPaymentButton(paymentButtonType: .buy, paymentButtonStyle: .black)

        init(action: @escaping () -> Void) {
            self.action = action
            super.init()
            button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
        }

        @objc func callback(_ sender: Any) {
            action()
        }
    }
}
