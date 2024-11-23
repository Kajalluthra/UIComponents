import SwiftUI
import Inject
import UIComponentsProtocols

public struct CustomAlertView: View, CustomAlertProtocol {

    @Binding var presentAlert: Bool
    let title: String
    let message: String
    @ObserveInjection var inject

    public init(presentAlert: Binding<Bool>,
                title: String,
                message: String) {
        self._presentAlert = presentAlert
        self.title = title
        self.message = message
    }

    public var body: some View {
        ZStack {
            if presentAlert {
                ThemePalette.base.containerFill.dominant.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                ErrorBanner(title: title, messages: [message])
                    .overlay(alignment: .topTrailing) {
                        Button {
                            self.presentAlert = false
                        } label: {
                            Image("CircleCloseBold", bundle: UIComponents.bundle)
                                .foregroundStyle(ThemePalette.icons.universal.warningCritical)
                        }
                        .padding(defaultPadding)
                    }
                    .padding(defaultPadding)
            }
        }
        .enableInjection()
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(presentAlert: .constant(true), title: "Error", message: "Error message")
            .setupUIComponents()
    }
}
