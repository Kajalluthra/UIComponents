import SwiftUI
import Core
import Inject
import UIComponentsProtocols

public struct OfflineBanner: View, OfflineBannerProtocol {

    @EnvironmentObject var networkMonitor: NetworkMonitor
    @State var showBanner: Bool = false
    @ObserveInjection var inject

    public init(){}
    
    public var body: some View {
        VStack {
            if showBanner {
                ThemePalette.icons.universal.warningMild
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        HStack {
                            Image("Offline", bundle: UIComponents.bundle)
                                .foregroundStyle(ThemePalette.icons.universal.strong)
                            Text("offline.banner.text".localized)
                                .font(.paragraphP2Light)
                                .foregroundStyle(ThemePalette.text.primary.one)
                        }
                            .padding(.horizontal, defaultPadding / 1.5)
                            .padding(.vertical, defaultPadding)
                    )
                    .frame(height: 74)
                    .enableInjection()
            }
        }
        .onAppear {
            withAnimation {
                self.showBanner = !networkMonitor.isConnected
            }
        }
        .onChange(of: networkMonitor.isConnected) { isConnected in
            withAnimation {
                self.showBanner = !isConnected
            }
        }
    }
}

struct OfflineBanner_Previews: PreviewProvider {
    static var previews: some View {
        let networkMonitor = NetworkMonitor()
        OfflineBanner()
            .environmentObject(networkMonitor)
            .setupUIComponents()
        disconnectNetwork(networkMonitor)
    }
    
    private static func disconnectNetwork(_ networkMonitor: NetworkMonitor) -> some View {
        networkMonitor.isConnected = false
        return EmptyView()
    }
}
