import SwiftUI

extension View {

    @ViewBuilder
    /* Allows for a view to be conditionally modified, for example by only applying API available in a particular iOS version.
     - Parameter _: A view builder that optionally returns a view.
     - Returns: The modified view, if the receiving view was modified, otherwise returns the receiving view. */
    public func modify(@ViewBuilder _ transform: (Self) -> (some View)?) -> some View {
        if let view = transform(self), !(view is EmptyView) {
            view
        } else {
            self
        }
    }
}
