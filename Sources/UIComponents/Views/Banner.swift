import SwiftUI
import Inject
import UIComponentsProtocols

public struct Banner: View, BannerProtocol {

    let message: String
    let messageColor: Color
    let leftColor: Color
    let borderColor: Color
    let backgroundColor: Color
    let font: Font
    @ObserveInjection var inject

    public init(message: String,
                messageColor: Color,
                leftColor: Color,
                borderColor: Color,
                backgroundColor: Color,
                font: Font) {
        self.message = message
        self.messageColor = messageColor
        self.leftColor = leftColor
        self.borderColor = borderColor
        self.backgroundColor = backgroundColor
        self.font = font
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text(message)
                    .font(font)
                    .foregroundStyle(messageColor)
                    .padding(defaultPadding)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(backgroundColor)
            .padding([.leading], 8)
        }
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(leftColor)
                .cornerRadius(4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(borderColor, lineWidth: 1)
        )
        .enableInjection()
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner(message: "Not all seating requests can be guaranteed",
               messageColor: Color(UIColor(hexString: "#002D30")!),
               leftColor: Color(UIColor(hexString: "#002D30")!),
               borderColor: Color(UIColor(hexString: "#DCE2E6")!),
               backgroundColor: Color(UIColor(hexString: "#F8F9FA")!),
               font: .paragraphP3Light)
    }
}
