//
//  CocoaAttributedStringTextView.swift
//  RailApp
//
//  Created by Stephen Anthony on 16/08/2023.
//

import SwiftUI

/// A SwiftUI view that allows for rendering of Cocoa's `NSAttributedString`.
/// This may be useful when requiring the use of string attributes that are not
/// supported by `AttributedString`.
public struct CocoaAttributedStringTextView: View {

    /// The attributed text displayed by the view.
    var attributedText: NSAttributedString
    @State private var height: CGFloat = .zero

    public init(attributedText: NSAttributedString) {
        self.attributedText = attributedText
    }

    public var body: some View {
        InternalTextView(attributedText: attributedText, dynamicHeight: $height)
            .frame(minHeight: height)
    }

    struct InternalTextView: UIViewRepresentable {

        var attributedText: NSAttributedString
        @Binding var dynamicHeight: CGFloat

        func makeUIView(context: Context) -> UITextView {
            let textView = UITextView()
            textView.textAlignment = .justified
            textView.isScrollEnabled = false
            textView.isUserInteractionEnabled = false
            textView.showsVerticalScrollIndicator = false
            textView.showsHorizontalScrollIndicator = false
            textView.allowsEditingTextAttributes = false
            textView.backgroundColor = .clear
            textView.textContainerInset = .zero
            textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            textView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
            return textView
        }

        func updateUIView(_ uiView: UITextView, context: Context) {
            uiView.attributedText = attributedText
            DispatchQueue.main.async {
                dynamicHeight = uiView.sizeThatFits(CGSize(width: uiView.bounds.width,
                                                           height: CGFloat.greatestFiniteMagnitude)).height
            }
        }
    }
}

#Preview {
    CocoaAttributedStringTextView(attributedText: NSAttributedString(string: "hello"))
}
