import SwiftUI
import Inject
import Core
import UIComponentsProtocols

public struct ChangesAndDurationView: View, ChangesAndDurationViewProtocol {

    let numChanges: Int
    let duration: String
    var showChangesAndDurationOnly = false
    let defaultHeight: CGFloat
    @Binding var showJourneyDetails: Bool
    @ObserveInjection var inject

    public init(numChanges: Int,
                duration: String,
                showChangesAndDurationOnly: Bool = false,
                defaultHeight: CGFloat,
                showJourneyDetails: Binding<Bool>) {
        self.numChanges = numChanges
        self.duration = duration
        self.showChangesAndDurationOnly = showChangesAndDurationOnly
        self.defaultHeight = defaultHeight
        self._showJourneyDetails = showJourneyDetails
    }

    public var body: some View {
        HStack {
            Text(RailAppStringUtils.getChangesAndDurationText(numChanges: numChanges, duration: duration))
                .font(.label4M)
                .foregroundStyle(ThemePalette.text.function.success)
                .underline(showChangesAndDurationOnly, color: ThemePalette.text.function.success)
                .padding([.leading], defaultPadding / 2)
                .onTapGesture {
                    guard showChangesAndDurationOnly else { return }
                    showJourneyDetails.toggle()
                }
            Spacer()
            if !showChangesAndDurationOnly {
                Button {
                    showJourneyDetails.toggle()
                } label: {
                    Text("journey.details.button".localized + ">")
                        .foregroundStyle(ThemePalette.text.primary.three)
                }
                .buttonStyle(ClearButtonStyle())
            }
        }
        .frame(height: defaultHeight)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(showChangesAndDurationOnly ? ThemePalette.base.containerFill.primary : ThemePalette.base.theme.primaryBackground)
                .cornerRadius(4)
        )
        .padding([.leading, .trailing], defaultPadding / 2)
        .padding([.bottom], defaultPadding / 4)
        .enableInjection()
    }
}

struct ChangesAndDurationView_Previews: PreviewProvider {
    static var previews: some View {
        ChangesAndDurationView(numChanges: 2, duration: "01:23", showChangesAndDurationOnly: false, defaultHeight: 40, showJourneyDetails: .constant(false))
            .setupUIComponents()
    }
}
