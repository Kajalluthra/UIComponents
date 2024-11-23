import SwiftUI

public struct DynamicButtonStyle: ButtonStyle {
    var isNeutral: Bool
    
    public init(isNeutral: Bool){
        self.isNeutral = isNeutral
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        Group {
            if isNeutral {
                NeutralTwoButtonStyle.NeutralTwoButtonStyleView(configuration: configuration)
            } else {
                SecondaryLightButtonStyle.SecondaryLightButtonStyleView(configuration: configuration)
            }
        }
    }
}
