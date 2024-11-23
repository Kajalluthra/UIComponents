import SwiftUI
import Core
import Inject
import UIComponentsProtocols

struct DirectionComponent: View, DirectionComponentProtocol {

    @Binding var selectorPresented: Bool
    @Binding var directionSelected: Directions
    @ObserveInjection var inject

    init(selectorPresented: Binding<Bool>,
         directionSelected: Binding<Directions>) {
        self._selectorPresented = selectorPresented
        self._directionSelected = directionSelected
    }
    
    var body: some View {
        let imageWidth = 13.0
        HStack {
            Text(directionSelected.getText())
                .font(.tableTitle2SemiBold)
                .foregroundStyle(ThemePalette.text.primary.one)
            Image("ArrowDownLight", bundle: UIComponents.bundle)
                .resizable()
                .foregroundStyle(ThemePalette.icons.universal.brand)
                .frame(width: imageWidth, height: imageWidth / 2)
            Spacer()
        }
        .padding([.top, .bottom], defaultPadding / 2)
        .onTapGesture {
            withAnimation {
                selectorPresented = true
            }
        }
        .enableInjection()
    }
}

struct DirectionComponent_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            DirectionComponent(selectorPresented: .constant(false), directionSelected: .constant(.departing))
            DirectionComponent(selectorPresented: .constant(false), directionSelected: .constant(.arriving))
        }
        .setupUIComponents()
    }
}
