//
//  FareAdditionalInformationView.swift
//  RailApp
//
//  Created by Stephen Anthony on 16/08/2023.
//

import SwiftUI
import UIComponentsProtocols

/// Displays additional information about a fare.
public struct FareAdditionalInformationView: View, FareAdditionalInformationViewProtocol {

    private static let borderWidth: CGFloat = 1
    private static let cornerRadius: CGFloat = 4

    /// The title used to describe the additional details of the fare.
    let title: String

    /// The additional fare details to inform the user of.
    let additionalDetails: [String]

    public init(title: String, 
                additionalDetails: [String]) {
        self.title = title
        self.additionalDetails = additionalDetails
    }

    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.label3S)
                    .foregroundStyle(ThemePalette.text.primary.one)
                let additionalDetailsText = additionalDetails.bulletedListCocoaAttributedString(withFont: UIFont(name: "Poppins-Light", size: 12) ?? .preferredFont(forTextStyle: .caption1),
                                                                                                textColour: ThemePalette.text.primary.one.uiColor)
                CocoaAttributedStringTextView(attributedText: additionalDetailsText)
            }
            .padding(8)
            Spacer()
        }
        .background(ThemePalette.base.theme.primaryBackground)
        .cornerRadius(FareAdditionalInformationView.cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: FareAdditionalInformationView.cornerRadius)
                .inset(by: FareAdditionalInformationView.borderWidth)
                .stroke(ThemePalette.base.containerStroke.defaultStroke, lineWidth: FareAdditionalInformationView.borderWidth)
        )
    }
}

struct FareAdditionalInformationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScrollView {
                VStack {
                    FareAdditionalInformationView(title: "Hello", additionalDetails: [
                        "I",
                        "have",
                        "a",
                        "few",
                        "points"
                    ])
                    FareAdditionalInformationView(title: "My title is a bit longer", additionalDetails: [
                        "My points are a bit longer",
                        "Some might say verbose, even obtuse. But, frankly, someone needs to make sure that the layout is correct for multi-line bullet points"
                    ])
                }
                .padding([.leading, .trailing], 16)
            }
        }
        .setupUIComponents()
    }
}

private extension Array where Element == String {
    func bulletedListCocoaAttributedString(withFont font: UIFont, textColour: UIColor) -> NSAttributedString {
        let text = map { "•\t\($0)" }
            .joined(separator: "\u{2029}") /// Paragraph separator

        let attributedString = NSMutableAttributedString(string: text)
        guard let mutableParagraphStyle = NSMutableParagraphStyle.default.mutableCopy() as? NSMutableParagraphStyle else {
            return attributedString
        }
        mutableParagraphStyle.headIndent = 8
        mutableParagraphStyle.tabStops = [NSTextTab(textAlignment: .left, location: mutableParagraphStyle.headIndent)]
        attributedString.addAttributes([
            .paragraphStyle: mutableParagraphStyle,
            .font: font,
            .foregroundColor: textColour
        ], range: NSRange(location: 0, length: attributedString.length))
        return attributedString
    }
}
