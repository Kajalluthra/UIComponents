import SwiftUI
import ActivityIndicatorView
import UIComponentsProtocols

public struct LoadingButton<Content: View>: View, LoadingButtonProtocol {

    @Binding var isLoading: Bool

    let content: Content
    var action: () -> Void = {}
    let loadingButtonStyle: LoadingButtonStyle
    let height: CGFloat = 48
    let activityIndicatorOffset: CGFloat = 6.0
    let activityIndicatorLineWidth: CGFloat = 5.0

    public init(action: @escaping () -> Void, 
                isLoading: Binding<Bool>,
                loadingButtonStyle: LoadingButtonStyle,
                @ViewBuilder builder: () -> Content) {
        self._isLoading = isLoading
        content = builder()
        self.action = action
        self.loadingButtonStyle = loadingButtonStyle
    }

    public var body: some View {
        Button {
            if !isLoading {
                action()
            }
        } label: {
            ZStack {
                Rectangle()
                    .fill(loadingButtonStyle == .light ? ThemePalette.interaction.fill.primaryTwo : ThemePalette.interaction.fill.primaryOne)
                    .frame(maxWidth: isLoading ? height : .infinity, maxHeight: height)
                    .cornerRadius(loadingButtonStyle == .light || isLoading ? height / 2 : 4)
                if isLoading {
                    let gradientColor = loadingButtonStyle == .light
                    ? [ThemePalette.icons.universal.strongReverse.opacity(0), ThemePalette.icons.universal.strongReverse]
                    : [ThemePalette.icons.universal.brand.opacity(0), ThemePalette.icons.universal.brand]
                    ActivityIndicatorView(isVisible: $isLoading, type: .gradient(gradientColor, lineWidth: activityIndicatorLineWidth))
                        .frame(width: height - activityIndicatorOffset, height: height - activityIndicatorOffset)
                } else {
                    VStack { content }
                        .foregroundStyle(loadingButtonStyle == .light ? ThemePalette.text.interaction.primaryTwo : ThemePalette.text.interaction.primaryOne)
                        .font(loadingButtonStyle == .light ? .buttonT1 : .buttonT2)
                }
            }
        }
        .disabled(isLoading)
        .animation(.easeInOut, value: isLoading)
    }
}

struct LoadingButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            LoadingButton(action: {}, isLoading: .constant(false), loadingButtonStyle: .light, builder: {
                Text("login.button")
            })
            LoadingButton(action: {}, isLoading: .constant(true), loadingButtonStyle: .light, builder: {
                Text("login.button")
            })
            LoadingButton(action: {}, isLoading: .constant(false), loadingButtonStyle: .dark, builder: {
                Text("password.reset.button")
            })
            LoadingButton(action: {}, isLoading: .constant(true), loadingButtonStyle: .dark, builder: {
                Text("password.reset.button")
            })
        }
        .padding()
        .setupUIComponents()
    }
}
