import SwiftUI
import ActivityIndicatorView
import Inject
import UIComponentsProtocols

public struct ActivityIndicator: View, ActivityIndicatorProtocol {
    @Binding var isVisible: Bool
    var activityIndicatorText: String?
    @ObserveInjection var inject

    public init(isVisible: Binding<Bool>, 
                activityIndicatorText: String? = nil) {
        self._isVisible = isVisible
        self.activityIndicatorText = activityIndicatorText
    }

    public var body: some View {
        VStack {
            ActivityIndicatorView(isVisible: $isVisible, type: .gradient([ThemePalette.icons.universal.brand.opacity(0), ThemePalette.icons.universal.brand], lineWidth: 8))
                .frame(width: 64, height: 64)
            Text(activityIndicatorText ?? "")
                .foregroundStyle(ThemePalette.text.primary.one)
                .font(.label2S)
        }
        .opacity(isVisible.asDouble)
        .background(isVisible ? ThemePalette.base.containerFill.primary.opacity(activityIndicatorText?.isEmpty ?? true ? 0.01 : 1) : .clear)
        .enableInjection()
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(isVisible: .constant(true), activityIndicatorText: "Loading")
            .setupUIComponents()
    }
}
