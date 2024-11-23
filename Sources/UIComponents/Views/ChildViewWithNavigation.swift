import SwiftUI
import Inject
import UIComponentsProtocols

public struct ChildViewWithNavigation: View, ChildViewWithNavigationProtocol {
    
    @EnvironmentObject var statusBarConfigurator: StatusBarConfigurator
    @EnvironmentObject var coordinator: Coordinator
    var presentingTitle: String
    @ObserveInjection var inject

    public init(presentingTitle: String) {
        self.presentingTitle = presentingTitle
    }

    public var body: some View {
        ThemePalette.base.theme.primaryBackground
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(false)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(ThemePalette.base.theme.primaryBackground, textColor: ThemePalette.text.primary.two.uiColor)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Image("ArrowBackBold", bundle: UIComponents.bundle)
                            .resizable()
                            .frame(width: 10, height: 20)
                            .foregroundStyle(ThemePalette.icons.universal.brand)
                        Text(self.presentingTitle)
                            .font(.buttonT4)
                            .foregroundStyle(ThemePalette.text.primary.one)
                    }
                    .onTapGesture {
                        self.coordinator.navigationPath.removeLast()
                    }
                }
            }
            .onAppear {
                statusBarConfigurator.statusBarStyle = .darkContent
            }
            .enableInjection()
    }
}

struct ChildViewWithNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ChildViewWithNavigation(presentingTitle: "Back")
            .environmentObject(StatusBarConfigurator())
            .setupUIComponents()
    }
}
