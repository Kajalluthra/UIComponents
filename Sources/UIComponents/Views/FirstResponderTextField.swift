import Foundation
import SwiftUI
import UIComponentsProtocols

struct FirstResponderTextField: UIViewRepresentable {

    @Binding var text: String
    @Binding var editing: Bool

    init(text: Binding<String>,
                editing: Binding<Bool>) {
        self._text = text
        self._editing = editing
    }

    class Coordinator: NSObject, UITextFieldDelegate {

        @Binding var text: String
        @Binding var editing: Bool

        var becameFirstResponder = false

        init(text: Binding<String>, editing: Binding<Bool>) {
            self._text = text
            self._editing = editing
        }

        public func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }

        public func textFieldDidBeginEditing(_ textField: UITextField) {
            editing = true
        }

        public func textFieldDidEndEditing(_ textField: UITextField) {
            editing = false
        }
    }

    public func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text, editing: $editing)
    }

    public func makeUIView(context: Context) -> some UIView {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.font = UIFont(name: "Poppins-Medium", size: 17)
        textField.textColor = ThemePalette.text.primary.one.uiColor
        return textField
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {
        if !context.coordinator.becameFirstResponder {
            uiView.becomeFirstResponder()
            context.coordinator.becameFirstResponder = true
        }
    }

}
