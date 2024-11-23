import SwiftUI
import Inject
import UIComponentsProtocols

public struct EmptyStationSearchBarContent: View, EmptyStationSearchBarContentProtocol {

    private var placeholderText: String
    private var isOptionalField: Bool = false
    private var onTap: () -> Void
    @ObserveInjection var inject

    public init(placeholderText: String, isOptionalField: Bool = false, onTap: @escaping () -> Void) {
        self.placeholderText = placeholderText
        self.isOptionalField = isOptionalField
        self.onTap = onTap
    }

    public var body: some View {
        HStack {
            HStack {
                Image("SearchLight", bundle: UIComponents.bundle)
                    .frame(width: 32, height: 32)
                    .foregroundStyle(ThemePalette.icons.universal.brand)
                Text(placeholderText)
                    .foregroundStyle(ThemePalette.text.primary.one)
                    .font(.paragraphP3Light)
                    .lineLimit(1)
                if isOptionalField {
                    Text("optional.value".localized)
                        .font(.paragraphP3Light)
                        .foregroundStyle(ThemePalette.text.primary.three)
                }
                Spacer()
            }
            .background(ThemePalette.base.containerFill.forms)
            .onTapGesture {
                onTap()
            }
        }
        .padding(defaultPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .stroke(ThemePalette.base.containerStroke.forms, lineWidth: 1)
                .frame(height: 56)
                .background(ThemePalette.base.containerFill.forms)
                .cornerRadius(4)
        )
        .enableInjection()
    }
}

struct EmptyStationSearchBarContent_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStationSearchBarContent(placeholderText: "hello", onTap: {})
            .setupUIComponents()
    }
}
