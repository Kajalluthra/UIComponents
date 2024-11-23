import SwiftUI
import Inject
import UIComponentsProtocols

public struct NavigationTitleView: View, NavigationTitleViewProtocol {

    var primaryText: String
    var secondaryText: String
    var rightNavigationButtonAction: RightNavigationButtonAction?

    @ObserveInjection var inject

    public init(primaryText: String,
                secondaryText: String,
                rightNavigationButtonAction: RightNavigationButtonAction? = nil) {
        self.primaryText = primaryText
        self.secondaryText = secondaryText
        self.rightNavigationButtonAction = rightNavigationButtonAction
    }

    public var body: some View {
        HStack(spacing: 3) {
            Text(primaryText)
                .font(.header4SemiBold)
                .foregroundStyle(ThemePalette.text.secondary.one)
            Text(secondaryText)
                .font(.header4SemiBold)
                .foregroundStyle(ThemePalette.text.function.success)
            if let rightNavigationButtonAction {
                Spacer()
                Button(rightNavigationButtonAction.title, action: rightNavigationButtonAction.action)
                    .font(rightNavigationButtonAction.style == .done ? .buttonT3 : .buttonT4)
                    .tint(ThemePalette.text.secondary.one)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .enableInjection()
    }
}

struct NavigationTitleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationTitleView(primaryText: "Live", secondaryText: "Trains")
            NavigationTitleView(primaryText: "Live",
                                secondaryText: "Trains",
                                rightNavigationButtonAction: RightNavigationButtonAction(title: "Edit", action: {}))
            .previewDisplayName("With Right Navigation Button")
        }
        .background(Color(UIColor(hexString: "#194245") ?? .green))
        .setupUIComponents()
    }
}
