import SwiftUI
import UIComponentsProtocols

public struct LiveTrainsSkeletonView: View, LiveTrainsSkeletonViewProtocol {

    @Binding var isVisible: Bool
    @State private var showCells = false

    public init(isVisible: Binding<Bool>) {
        self._isVisible = isVisible
    }

    public var body: some View {
        if isVisible {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    if showCells {
                        ForEach(0..<15) { index in
                            VStack(spacing: -10) {
                                LiveTrainsSkeletonCell()
                                    .frame(height: 72)
                                    .border(ThemePalette.base.containerStroke.defaultStroke, width: 1)
                                    .background(ThemePalette.base.containerFill.primary)
                                Rectangle()
                                    .foregroundStyle(.clear)
                                    .frame(height: 4)
                            }
                            .transaction { $0.animation = $0.animation?.delay(0.1 * Double(index)) }
                            .transition(.slide)
                        }
                    }
                }.onAppear {
                    withAnimation(.easeInOut) {
                        showCells.toggle()
                    }
                }.onDisappear {
                    showCells.toggle()
                }
            }
            .disabled(true)
            .background(Color.clear)
        }
    }
}

struct LiveTrainsSkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        LiveTrainsSkeletonView(isVisible: .constant(true))
            .setupUIComponents()
    }
}
