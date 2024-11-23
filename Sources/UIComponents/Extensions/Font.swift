import SwiftUI

extension Font {

    static func poppinsLight(size: CGFloat) -> Font {
        return .custom("Poppins-Light", size: size)
    }

    static func poppinsRegular(size: CGFloat) -> Font {
        return .custom("Poppins-Regular", size: size)
    }

    static func poppinsMedium(size: CGFloat) -> Font {
        return .custom("Poppins-Medium", size: size)
    }

    static func poppinsSemiBold(size: CGFloat) -> Font {
        return .custom("Poppins-SemiBold", size: size)
    }

    static func poppinsBold(size: CGFloat) -> Font {
        return .custom("Poppins-Bold", size: size)
    }

}

extension Font {

    // Headers
    public static let pageHeaderXSSemiBold = Font.poppinsSemiBold(size: 24)
    public static let header4SemiBold = Font.poppinsSemiBold(size: 18)
    public static let header4Light = Font.poppinsLight(size: 18)
    public static let header5SemiBold = Font.poppinsSemiBold(size: 14)

    // Paragraph
    public static let paragraphP2Light = Font.poppinsLight(size: 14)
    public static let paragraphP2Medium = Font.poppinsMedium(size: 14)
    public static let paragraphP3Light = Font.poppinsLight(size: 17)
    public static let paragraphP3Medium = Font.poppinsMedium(size: 17)
    public static let paragraphP5Regular = Font.poppinsRegular(size: 20)

    // Tables
    public static let tableTitle2SemiBold = Font.poppinsSemiBold(size: 17)
    public static let tableTitle2M = Font.poppinsRegular(size: 17)
    public static let tableTitle3Regular = Font.poppinsRegular(size: 16)
    public static let tableContent1L = Font.poppinsLight(size: 16)
    public static let tableContent2M = Font.poppinsLight(size: 14)
    public static let tableContent3M = Font.poppinsLight(size: 13)
    public static let tableContent4S = Font.poppinsLight(size: 12)

    // Labels
    public static let label1XS = Font.poppinsLight(size: 10)
    public static let label2S = Font.poppinsRegular(size: 12)
    public static let label3S = Font.poppinsSemiBold(size: 12)
    public static let label4M = Font.poppinsRegular(size: 13)
    public static let label5L = Font.poppinsBold(size: 13)

    // Buttons
    public static let buttonT1 = Font.poppinsBold(size: 18)
    public static let buttonT2 = Font.poppinsBold(size: 14)
    public static let buttonT3 = Font.poppinsSemiBold(size: 13)
    public static let buttonT4 = Font.poppinsRegular(size: 13)

    // Display
    public static let display4 = Font.poppinsSemiBold(size: 30)
    public static let display6 = Font.poppinsSemiBold(size: 20)
    public static let display7 = Font.poppinsRegular(size: 20)
    public static let display9 = Font.poppinsSemiBold(size: 14)
    
    // Small print
    public static let smallPrint1 = Font.poppinsLight(size: 11)
}
