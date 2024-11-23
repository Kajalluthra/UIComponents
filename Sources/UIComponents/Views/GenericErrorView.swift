import SwiftUI
import UIComponentsProtocols

public struct GenericErrorView: View, GenericErrorViewProtocol {
    @Environment(\.presentationMode) var presentation
    
    private let title: String
    private let message: String
    private let buttonText: String
    private let buttonAction: (() -> Void)?
    
    public init(title: String?,
                message: String?,
                buttonText: String?,
                buttonAction: (() -> Void)? = nil) {
        self.title = title ?? "generic.error.title"
        self.message = message ?? "generic.error.message"
        self.buttonText = buttonText ?? "ok.button.text"
        self.buttonAction = buttonAction
    }
    
    public var body: some View {
        VStack(alignment: .center) {
            Image("GenericError", bundle: UIComponents.bundle)
            Text(title.localized)
                .font(.paragraphP3Medium)
                .foregroundStyle(ThemePalette.text.primary.three)
            Text(message.localized)
                .font(.paragraphP3Light)
                .foregroundStyle(ThemePalette.text.primary.three)
                .padding(.horizontal, defaultPadding)
                .multilineTextAlignment(.center)
            Button {
                if let buttonAction = buttonAction {
                    buttonAction()
                } else {
                    presentation.wrappedValue.dismiss()
                }
            } label: {
                Text(buttonText.localized)
            }
            .buttonStyle(SecondaryDarkButtonStyle())
        }
        .background(ThemePalette.base.containerFill.primary)
    }
}

#Preview {
    GenericErrorView(title: nil, message: nil, buttonText: nil)
        .setupUIComponents()
}
