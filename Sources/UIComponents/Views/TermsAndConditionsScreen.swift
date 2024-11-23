import SwiftUI
import UIComponentsProtocols
import Core

public struct TermsAndConditionsScreen: View, TermsAndConditionsViewProtocol {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var isSharePresented: Bool = false
    
    public init() {}
    
    public var body: some View {
        VStack {
            CloseButtonView()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .top], defaultPadding)
            Text("terms.and.conditions.title".localized)
                .font(.pageHeaderXSSemiBold)
                .foregroundStyle(ThemePalette.text.primary.two)
            ScrollView {
                Text("terms.and.conditions.text".localized)
                    .font(.paragraphP2Light)
                    .foregroundStyle(ThemePalette.text.primary.one)
                    .padding(defaultPadding)
                Button {
                    isSharePresented.toggle()
                } label: {
                    Text("print.text".localized)
                }
                .buttonStyle(NeutralTwoButtonStyle())

                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("close.text".localized)
                }
                .buttonStyle(SecondaryDarkButtonStyle())
                .sheet(isPresented: $isSharePresented) {
                    ActivityViewController(activityItems: ["terms.and.conditions.text".localized])
                }
            }
            Spacer()
        }
        .background(ThemePalette.base.containerFill.primary)
        .trackScreen("TermsAndConditionsScreen")
    }
}

struct TermsAndConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditionsScreen()
            .setupUIComponents()
    }
}
