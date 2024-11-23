import Foundation

public struct RightNavigationButtonAction {
    public let title: String
    public let style: RightNavigationButtonStyle
    public let action: () -> Void

    public init(title: String, style: RightNavigationButtonStyle = .plain,
                action: @escaping () -> Void) {
        self.title = title
        self.style = style
        self.action = action
    }
}
