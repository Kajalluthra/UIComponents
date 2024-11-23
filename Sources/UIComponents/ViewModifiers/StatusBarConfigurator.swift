import UIKit
import SwiftUI

public class StatusBarConfigurator: ObservableObject {

    private var window: UIWindow?

    public init(window: UIWindow? = nil, statusBarStyle: UIStatusBarStyle = .default) {
        self.window = window
        self.statusBarStyle = statusBarStyle
    }

    public var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            window?.rootViewController?.setNeedsStatusBarAppearanceUpdate()
        }
    }

    fileprivate func prepare(scene: UIWindowScene) {
        if window == nil {
            let window = UIWindow(windowScene: scene)
            let viewController = ViewController()
            viewController.configurator = self
            window.rootViewController = viewController
            window.frame = UIScreen.main.bounds
            window.alpha = 0
            self.window = window
        }
        window?.windowLevel = .statusBar
        window?.makeKeyAndVisible()
    }

    fileprivate class ViewController: UIViewController {
        weak var configurator: StatusBarConfigurator!
        override var preferredStatusBarStyle: UIStatusBarStyle { configurator.statusBarStyle }
    }
}

private struct SceneFinder: UIViewRepresentable {

    var getScene: ((UIWindowScene) -> Void)?

    func makeUIView(context: Context) -> View { View() }
    func updateUIView(_ uiView: View, context: Context) { uiView.getScene = getScene }

    class View: UIView {
        var getScene: ((UIWindowScene) -> Void)?
        override func didMoveToWindow() {
            if let scene = window?.windowScene {
                getScene?(scene)
            }
        }
    }
}

extension View {
    public func prepareStatusBarConfigurator(_ configurator: StatusBarConfigurator) -> some View {
        return self.background(SceneFinder { scene in
            configurator.prepare(scene: scene)
        })
    }
}
