import SwiftUI
import Core
import Inject
import UIComponentsProtocols

public struct FloatingLabelTextField: View, FloatingLabelTextFieldProtocol {
    private let title: String
    private let validator: Validator?
    @State private var validationStarted: Bool = false
    @Environment(\.isMandatory) var isMandatory
    @Environment(\.matchValue) var matchValue
    @Binding private var text: String
    @Binding private var isValid: Bool
    @State var validationMessage: String = ""
    private let customValidationMessage: String
    private let format: String?
    private let isSecureField: Bool
    private let hideFloatingLabel: Bool
    @State var hidePassword: Bool = true
    @ObserveInjection var inject
    @FocusState var isInFocus: Bool
    let lineWidth: CGFloat = 1.0

    public init(_ title: String, 
                text: Binding<String>,
                format: String? = nil,
                validator: Validator? = nil,
                isValid: Binding<Bool> = .constant(true),
                isSecureField: Bool = false,
                hideFloatingLabel: Bool = false,
                customValidationMessage: String = "") {
        self.title = title
        self._text = text
        self.format = format
        self.validator = validator
        self._isValid = isValid
        self.isSecureField = isSecureField
        self.hideFloatingLabel = hideFloatingLabel
        self.customValidationMessage = customValidationMessage
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            if !isValid {
                let validationMessage = customValidationMessage.isEmpty ? self.validationMessage : customValidationMessage
                Text(validationMessage)
                    .foregroundStyle(ThemePalette.text.function.error)
                    .offset(y: -defaultPadding * 2.5)
                    .font(.label4M)
                    .padding(.leading, 0)
                    .background(Color.clear)
            } else {
                Text(title)
                    .foregroundStyle(ThemePalette.text.primary.three)
                    .offset(y: text.isEmpty ? 0 : -defaultPadding * 2.5)
                    .font(text.isEmpty ? .paragraphP3Light : .label4M)
                    .padding(.leading, text.isEmpty ?  defaultPadding : 0)
                    .opacity(text.isEmpty ? 1.0 : (!hideFloatingLabel).asDouble)
            }
            HStack(alignment: .center) {
                Group {
                    if hidePassword && isSecureField {
                        SecureField("", text: $text)
                            .focused($isInFocus)
                    } else {
                        TextField("", text: $text)
                            .focused($isInFocus)
                    }
                }
                .disableAutocorrection(true)
                .font(.paragraphP3Medium)
                .foregroundStyle(ThemePalette.text.primary.one)
                .padding(defaultPadding)
                .onChange(of: text) { newValue in
                    if let format = format {
                        text = newValue.format(format, oldString: text)
                    }
                    validate(newValue)
                }
                Spacer()
                if isSecureField {
                    Button {
                        hidePassword.toggle()
                    } label: {
                        Image(hidePassword ? "Hidden" : "Shown", bundle: UIComponents.bundle)
                            .foregroundStyle(ThemePalette.icons.universal.brand)
                    }
                    .padding(defaultPadding)
                } else if validationStarted {
                    Image(isValid ? "TickBold" : "CircleWarningLight", bundle: UIComponents.bundle)
                        .foregroundStyle(isValid ? ThemePalette.icons.universal.brand : ThemePalette.icons.universal.error)
                        .padding(defaultPadding)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(
                        isInFocus ? ThemePalette.base.containerStroke.focus : (validationMessage.isEmpty && customValidationMessage.isEmpty ? ThemePalette.base.containerStroke.forms : ThemePalette.base.containerStroke.error),
                        lineWidth: lineWidth
                    )
                    .shadow(color: isInFocus ? ThemePalette.base.containerStroke.focus : Color.clear, radius: 2, x: 0, y: 0)
            )
        }
        .onChange(of: isValid, perform: { _ in
            validate(text)
        })
        .background(ThemePalette.base.containerFill.forms)
        .padding(.top, defaultPadding)
        .padding(.horizontal, lineWidth)
        .enableInjection()
    }

    private func validate(_ newValue: String) {
        guard let validator = validator else { return }
        validationStarted = true
        isValid = true
        if isMandatory {
            isValid = !newValue.isEmpty
            validationMessage = isValid ? "" : title + " " + "required.option".localized.lowercased()
        }

        if isValid {
            let validationResult = validator.validate(value: newValue)
            switch validationResult {
            case .success:
                guard matchValue.isEmpty else {
                    if matchValue != newValue {
                        isValid = false
                        validationMessage = "password.do.not.match.text".localized
                    }
                    return
                }
                isValid = true
                validationMessage = ""
            case .failure(let error):
                isValid = false
                validationMessage = error.localizedDescription
            }
        }
    }
}

struct FloatingLabelTextField_Previews: PreviewProvider {
    static var previews: some View {
        FloatingLabelTextField("Card number", text: .constant(""), validator: NameValidator(), isValid: .constant(true))
            .setupUIComponents()
    }
}
