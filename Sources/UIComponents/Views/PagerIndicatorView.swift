import SwiftUI
import UIComponentsProtocols

public struct PagerIndicatorView: View, PagerIndicatorViewProtocol {

    let numberOfPages: Int
    @Binding var currentPage: Int

    public init(numberOfPages: Int, currentPage: Binding<Int>) {
        self.numberOfPages = numberOfPages
        self._currentPage = currentPage
    }

    public var body: some View {
        HStack(spacing: defaultPadding) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                index == currentPage ? Image("PageSelectedIndicator", bundle: UIComponents.bundle) : Image("PageUnselectedIndicator", bundle: UIComponents.bundle)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(ThemePalette.base.containerStroke.defaultStroke)
                .padding(.horizontal, -defaultPadding)
                .padding(.vertical, -defaultPadding / 2)
        )
        .opacity((numberOfPages > 1).asDouble)
        .padding(.bottom, defaultPadding * 3)
    }
}

#Preview {
    PagerIndicatorView(numberOfPages: 3, currentPage: .constant(1))
        .setupUIComponents()
}
