import SwiftUI
import Inject
import UIComponentsProtocols

public struct FlexibleLayoutHStack<Model, V>: FlexibleLayoutHStackProtocol, View where Model: Hashable, V: View {

    public typealias ViewGenerator = (Model) -> V

    public var models: [Model]
    public var viewGenerator: ViewGenerator
    public var horizontalSpacing: CGFloat = defaultPadding / 4
    public var verticalSpacing: CGFloat = defaultPadding / 4

    @State private var totalHeight = CGFloat.zero
    @ObserveInjection var inject

    public init(models: [Model],
                viewGenerator: @escaping ViewGenerator) {
        self.models = models
        self.viewGenerator = viewGenerator
    }

    public var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
        .enableInjection()
    }

    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.models, id: \.self) { models in
                viewGenerator(models)
                    .padding(.horizontal, horizontalSpacing)
                    .padding(.vertical, verticalSpacing)
                    .alignmentGuide(.leading, computeValue: { dimension in
                        if abs(width - dimension.width) > geometry.size.width {
                            width = 0
                            height -= dimension.height
                        }
                        let result = width
                        if models == self.models.last {
                            width = 0
                        } else {
                            width -= dimension.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {_ in
                        let result = height
                        if models == self.models.last {
                            height = 0
                        }
                        return result
                    })
            }
        }
        .background(viewHeightReader($totalHeight))
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}
