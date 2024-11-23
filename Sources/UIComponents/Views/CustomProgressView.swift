import SwiftUI
import UIComponentsProtocols

public struct CustomProgressView: View, CustomProgressViewProtocol {
    
    let value: Double
    let total: Double
    private let bigSize = 24.0
    private let smallSize = 18.0
    private let imageMargin = 4.0
    private var progress: Double {
        return value / total
    }
    @State private var pulseEffect = false
    public init(value: Double, total: Double) {
        self.value = value
        self.total = total
    }
    
    public var body: some View {
        if progress >= 0 {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: 2)
                        .foregroundColor(progress == 0.0 ? .clear : ThemePalette.journeyDiagram.future)
                    
                    Rectangle()
                        .frame(width: min(progress * geometry.size.width, geometry.size.width), height: 2)
                        .foregroundColor(ThemePalette.journeyDiagram.past)
                }
                .overlay(alignment: .leading, content: {
                    let imageName = progress == 0.0 || progress == 1.0 ? "TrackSectionBig": "TrackSectionSmall"
                    let imageSize = progress == 0.0 || progress == 1.0 ? bigSize : smallSize
                    let offsetWidth = getOffsetWidth(progress: progress, totalWidth: geometry.size.width)
                    Image(imageName, bundle: UIComponents.bundle)
                        .resizable()
                        .scaleEffect(pulseEffect ? 1.2 : 1.0, anchor: .center)
                        .frame(width: imageSize, height: imageSize)
                        .background(Color.clear)
                        .offset(CGSize(width: offsetWidth, height: 0))
                })
                .rotationEffect(.degrees(90))
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                        pulseEffect.toggle()
                    }
                }
            }
        }
    }
    
    private func getOffsetWidth(progress: Double, totalWidth: CGFloat) -> Double {
        switch progress {
        case 0.0:
            return -(bigSize - imageMargin)
        case 1.0:
            return progress * totalWidth
        default:
            return progress * totalWidth - imageMargin
        }
    }
}

#Preview {
    CustomProgressView(value: 1.0, total: 1.0)
        .setupUIComponents()
        .frame(width: 50)
        .padding(.top, 200)
}
