import SwiftUI
import Inject
import Core
import UIComponentsProtocols

public struct ErrorBanner: View, ErrorBannerProtocol {

    var title: String?
    var messages: [String]
    @State private var formattedMessages: [AttributedString]?
    var iconName: String = "CircleWarningLight"
    var isCollapsible: Bool = false
    @State var displayMessage: Bool = false
    @ObserveInjection var inject

    public init(title: String? = nil,
                messages: [String],
                iconName: String = "CircleWarningLight",
                isCollapsible: Bool = false,
                displayMessage: Bool = false) {
        self.title = title
        self.messages = messages
        self.iconName = iconName
        self.isCollapsible = isCollapsible
        self.displayMessage = displayMessage
    }

    public var body: some View {
        VStack(alignment: .leading) {
            if let title = title {
                HStack {
                    Image(iconName, bundle: UIComponents.bundle)
                    Text(title)
                        .font(.paragraphP3Medium)
                    Spacer()
                    if isCollapsible {
                        Button {
                            withAnimation(.default) {
                                displayMessage.toggle()
                            }
                        } label: {
                            Image(displayMessage ? "ArrowUpLight" : "ArrowDownLight", bundle: UIComponents.bundle)
                                .foregroundStyle(ThemePalette.icons.universal.warningCritical)
                        }
                    }
                }
                .foregroundStyle(ThemePalette.text.function.error)
            }
            if ((isCollapsible && displayMessage) || !isCollapsible), let formattedMessages = formattedMessages {
                LazyVStack(alignment: .leading, spacing: defaultPadding) {
                    ForEach(formattedMessages, id: \.self) { message in
                        Text(message)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(defaultPadding)
        .background(
            BannerBackground(lineColor: ThemePalette.base.containerStroke.error)
        )
        .onAppear {
            formattedMessages = try? messages.map({ message in
                var formattedMessage = try message.htmlToAttributedString()
                formattedMessage.font = .paragraphP3Light
                formattedMessage.foregroundColor = ThemePalette.text.primary.one
                return formattedMessage
            })
        }
        .enableInjection()
    }
}

struct ErrorBanner_Previews: PreviewProvider {
    static var previews: some View {
        ErrorBanner(title: "Title", messages: ["Error message a little bit longer to occupy more than one line "], displayMessage: true)
            .setupUIComponents()
    }
}
