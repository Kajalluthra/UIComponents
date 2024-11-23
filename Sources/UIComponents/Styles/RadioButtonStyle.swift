import SwiftUI

public struct RadioButtonStyle: ButtonStyle {

    public init() {}

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(Color.clear)
    }
}
