import SwiftUI
import UIComponentsProtocols

public struct EmailSentView: View, EmailSentViewProtocol {

    let email: String
    let explanationText: String
    let resendEmailAction: () -> Void

    public init(email: String, explanationText: String, resendEmailAction: @escaping () -> Void) {
        self.email = email
        self.explanationText = explanationText
        self.resendEmailAction = resendEmailAction
    }

    public var body: some View {
        VStack {
            VStack {
                (Text("sent.email.text".localized)
                    .font(.paragraphP3Light) +
                 Text(email)
                    .font(.paragraphP3Medium)
                )
                .foregroundStyle(ThemePalette.text.primary.one)
                .frame(maxWidth: .infinity, alignment: .leading)
                Image("EmailSent", bundle: UIComponents.bundle)
                Text(explanationText)
                    .font(.paragraphP3Light)
                    .foregroundStyle(ThemePalette.text.primary.one)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(defaultPadding)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(ThemePalette.base.containerStroke.defaultStroke)
                    .background(ThemePalette.base.containerFill.strong)
            )
            Button {
                resendEmailAction()
            } label: {
                HStack {
                    Spacer()
                    Text("resend.email.button".localized)
                    Image("ArrowForwardLight", bundle: UIComponents.bundle)
                        .foregroundStyle(ThemePalette.icons.universal.brand)
                }
            }
            .buttonStyle(ClearButtonStyle())
            Spacer()
        }

    }
}

struct EmailSentView_Previews: PreviewProvider {
    static var previews: some View {
        EmailSentView(email: "hello@hello.com", explanationText: "confirm.email.login.text".localized, resendEmailAction: {})
            .setupUIComponents()
    }
}
