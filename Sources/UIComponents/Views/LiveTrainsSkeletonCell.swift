import SwiftUI
import UIComponentsProtocols

struct LiveTrainsSkeletonCell: View {

    var body: some View {
        HStack {
            Text("08:15")
                .font(.display6)
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .fill(ThemePalette.base.theme.primaryBackground)
                        .frame(height: 16)
                )
            Text("Destination Station")
                .font(.display7)
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .fill(ThemePalette.base.theme.primaryBackground)
                        .frame(height: 16)
                )
            Spacer()
            Image("ArrowForwardBold", bundle: UIComponents.bundle)
                .foregroundStyle(ThemePalette.icons.universal.disabled)
        }
        .padding()
        .background(ThemePalette.base.containerFill.primary)
    }
}

struct SkeletonCell_Previews: PreviewProvider {
    static var previews: some View {
        LiveTrainsSkeletonCell()
            .setupUIComponents()
    }
}
