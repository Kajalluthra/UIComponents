import Foundation
import SwiftUI

public class Coordinator: ObservableObject {
    @Published public var navigationPath = NavigationPath()
    
    public init(navigationPath: NavigationPath = NavigationPath()) {
        self.navigationPath = navigationPath
    }
}
