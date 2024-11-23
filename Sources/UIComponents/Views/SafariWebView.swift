import SwiftUI
import SafariServices
import UIComponentsProtocols

public struct SafariWebView: UIViewControllerRepresentable, SafariWebViewProtocol {

    let url: URL

    public init(url: URL) {
        self.url = url
    }

    public func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    public func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}
