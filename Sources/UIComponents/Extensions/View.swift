import SwiftUI

extension View {
    public func tabViewStyle(backgroundColor: Color? = nil,
                             itemColor: Color? = nil,
                             selectedItemColor: Color? = nil,
                             badgeColor: Color? = nil,
                             foregroundColor: Color) -> some View {
        onAppear {
            let itemAppearance = UITabBarItemAppearance()
            let imageAndTitleDistance = 5
            let verticalOffset = CGFloat(-(imageAndTitleDistance / 2)) // We remove half of the distance between the image and the text
            if let uiItemColor = itemColor?.uiColor {
                itemAppearance.normal.iconColor = uiItemColor
                itemAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: verticalOffset)
                itemAppearance.normal.titleTextAttributes = [
                    .foregroundColor: uiItemColor,
                    .font: UIFont(name: "Poppins-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12)
                ]
            }
            if let uiSelectedItemColor = selectedItemColor?.uiColor {
                itemAppearance.selected.iconColor = uiSelectedItemColor
                itemAppearance.selected.titleTextAttributes = [
                    .foregroundColor: foregroundColor.uiColor,
                    .font: UIFont(name: "Poppins-SemiBold", size: 12) ?? UIFont.systemFont(ofSize: 12)
                ]
            }
            if let uiBadgeColor = badgeColor?.uiColor {
                itemAppearance.normal.badgeBackgroundColor = uiBadgeColor
                itemAppearance.selected.badgeBackgroundColor = uiBadgeColor
            }

            let appearance = UITabBarAppearance()
            if let uiBackgroundColor = backgroundColor?.uiColor {
                appearance.backgroundColor = uiBackgroundColor
                appearance.shadowColor = ThemePalette.base.containerFill.strong.uiColor
            }
            appearance.stackedLayoutAppearance = itemAppearance
            appearance.inlineLayoutAppearance = itemAppearance
            appearance.compactInlineLayoutAppearance = itemAppearance

            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
            UITabBar.appearance().backgroundImage = UIImage()
        }

    }
}

extension View {
    public func navigationBarColor(_ backgroundColor: Color, textColor: UIColor) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, textColor: textColor))
    }
}

extension View {
    public func isMandatory(_ value: Bool = true) -> some View {
        environment(\.isMandatory, value)
    }
}

extension View {
    public func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

extension View {
    public func matchValue(_ value: String = "") -> some View {
        environment(\.matchValue, value)
    }
}

extension View {
    public func setupUIComponents() -> some View {
        UIComponents.setup()
        return self
    }
}
