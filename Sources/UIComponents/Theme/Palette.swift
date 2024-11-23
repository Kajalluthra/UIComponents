import SwiftUI

extension Theme {
    public struct Palette {
        public let base: Base
        public let text: Text
        public let icons: Icons
        public let interaction: Interaction
        public let journeyDiagram: JourneyDiagram
        public let spotColours: SpotColours
        public let seatMaps: SeatMaps
        
        init(lightPaletteModel: ThemeModel, darkPaletteModel: ThemeModel) throws {
            base = try Base(lightPaletteModel: lightPaletteModel.base, darkPaletteModel: darkPaletteModel.base)
            text = try Text(lightPaletteModel: lightPaletteModel.text, darkPaletteModel: darkPaletteModel.text)
            icons = try Icons(lightPaletteModel: lightPaletteModel.icons, darkPaletteModel: darkPaletteModel.icons)
            interaction = try Interaction(lightPaletteModel: lightPaletteModel.interaction, darkPaletteModel: darkPaletteModel.interaction)
            journeyDiagram = try JourneyDiagram(lightPaletteModel: lightPaletteModel.journeyDiagram, darkPaletteModel: darkPaletteModel.journeyDiagram)
            spotColours = try SpotColours(lightPaletteModel: lightPaletteModel.spotColours, darkPaletteModel: darkPaletteModel.spotColours)
            seatMaps = try SeatMaps(lightPaletteModel: lightPaletteModel.seatMaps, darkPaletteModel: darkPaletteModel.seatMaps)
        }
    }
    
    public struct Base {
        public let theme: BaseTheme
        public let containerFill: ContainerFill
        public let containerStroke: ContainerStroke
        
        init(lightPaletteModel: ThemeModel.Base, darkPaletteModel: ThemeModel.Base) throws {
            theme = try BaseTheme(lightPaletteModel: lightPaletteModel.theme, darkPaletteModel: darkPaletteModel.theme)
            containerFill = try ContainerFill(lightPaletteModel: lightPaletteModel.fill, darkPaletteModel: darkPaletteModel.fill)
            containerStroke = try ContainerStroke(lightPaletteModel: lightPaletteModel.stroke, darkPaletteModel: darkPaletteModel.stroke)
        }
    }
    
    public struct BaseTheme {
        public let navigation: Color
        public let primaryBackground: Color
        public let appSecondaryBackgroundOne: Color
        public let appSecondaryBackgroundTwo: Color
        
        init(lightPaletteModel: ThemeModel.BaseTheme, darkPaletteModel: ThemeModel.BaseTheme) throws {
            navigation = try Color(UIColor.dynamicColor(light: lightPaletteModel.navigation.color.get(), dark: darkPaletteModel.navigation.color.get()))
            primaryBackground = try Color(UIColor.dynamicColor(light: lightPaletteModel.primaryBackground.color.get(), dark: darkPaletteModel.primaryBackground.color.get()))
            appSecondaryBackgroundOne = try Color(UIColor.dynamicColor(light: lightPaletteModel.appSecondaryBackgroundOne.color.get(), dark: darkPaletteModel.appSecondaryBackgroundOne.color.get()))
            appSecondaryBackgroundTwo = try Color(UIColor.dynamicColor(light: lightPaletteModel.appSecondaryBackgroundTwo.color.get(), dark: darkPaletteModel.appSecondaryBackgroundTwo.color.get()))
        }
    }
    
    public struct ContainerFill {
        public let primary: Color
        public let secondary: Color
        public let strong: Color
        public let dominant: Color
        public let forms: Color
        public let noteworthy: Color
        public let important: Color
        public let positive: Color
        public let error: Color
        public let warningCritical: Color
        public let warningImportant: Color
        public let warningMild: Color
        
        init(lightPaletteModel: ThemeModel.ContainerFill, darkPaletteModel: ThemeModel.ContainerFill) throws {
            primary = try Color(UIColor.dynamicColor(light: lightPaletteModel.primary.color.get(), dark: darkPaletteModel.primary.color.get()))
            secondary = try Color(UIColor.dynamicColor(light: lightPaletteModel.secondary.color.get(), dark: darkPaletteModel.secondary.color.get()))
            strong = try Color(UIColor.dynamicColor(light: lightPaletteModel.strong.color.get(), dark: darkPaletteModel.strong.color.get()))
            dominant = try Color(UIColor.dynamicColor(light: lightPaletteModel.dominant.color.get(), dark: darkPaletteModel.dominant.color.get()))
            forms = try Color(UIColor.dynamicColor(light: lightPaletteModel.forms.color.get(), dark: darkPaletteModel.forms.color.get()))
            noteworthy = try Color(UIColor.dynamicColor(light: lightPaletteModel.noteworthy.color.get(), dark: darkPaletteModel.noteworthy.color.get()))
            important = try Color(UIColor.dynamicColor(light: lightPaletteModel.important.color.get(), dark: darkPaletteModel.important.color.get()))
            positive = try Color(UIColor.dynamicColor(light: lightPaletteModel.positive.color.get(), dark: darkPaletteModel.positive.color.get()))
            error = try Color(UIColor.dynamicColor(light: lightPaletteModel.error.color.get(), dark: darkPaletteModel.error.color.get()))
            warningCritical = try Color(UIColor.dynamicColor(light: lightPaletteModel.warningCritical.color.get(), dark: darkPaletteModel.warningCritical.color.get()))
            warningImportant = try Color(UIColor.dynamicColor(light: lightPaletteModel.warningImportant.color.get(), dark: darkPaletteModel.warningImportant.color.get()))
            warningMild = try Color(UIColor.dynamicColor(light: lightPaletteModel.warningMild.color.get(), dark: darkPaletteModel.warningMild.color.get()))
        }
    }
    
    public struct ContainerStroke {
        public let defaultStroke: Color
        public let forms: Color
        public let focus: Color
        public let divider: Color
        public let noteworthy: Color
        public let important: Color
        public let success: Color
        public let error: Color
        public let warningCritical: Color
        public let warningImportant: Color
        public let warningMild: Color
        public let disabled: Color
        
        init(lightPaletteModel: ThemeModel.ContainerStroke, darkPaletteModel: ThemeModel.ContainerStroke) throws {
            defaultStroke = try Color(UIColor.dynamicColor(light: lightPaletteModel.default.color.get(), dark: darkPaletteModel.default.color.get()))
            forms = try Color(UIColor.dynamicColor(light: lightPaletteModel.forms.color.get(), dark: darkPaletteModel.forms.color.get()))
            focus = try Color(UIColor.dynamicColor(light: lightPaletteModel.focus.color.get(), dark: darkPaletteModel.focus.color.get()))
            divider = try Color(UIColor.dynamicColor(light: lightPaletteModel.divider.color.get(), dark: darkPaletteModel.divider.color.get()))
            noteworthy = try Color(UIColor.dynamicColor(light: lightPaletteModel.noteworthy.color.get(), dark: darkPaletteModel.noteworthy.color.get()))
            important = try Color(UIColor.dynamicColor(light: lightPaletteModel.important.color.get(), dark: darkPaletteModel.important.color.get()))
            success = try Color(UIColor.dynamicColor(light: lightPaletteModel.success.color.get(), dark: darkPaletteModel.success.color.get()))
            error = try Color(UIColor.dynamicColor(light: lightPaletteModel.error.color.get(), dark: darkPaletteModel.error.color.get()))
            warningCritical = try Color(UIColor.dynamicColor(light: lightPaletteModel.warningCritical.color.get(), dark: darkPaletteModel.warningCritical.color.get()))
            warningImportant = try Color(UIColor.dynamicColor(light: lightPaletteModel.warningImportant.color.get(), dark: darkPaletteModel.warningImportant.color.get()))
            warningMild = try Color(UIColor.dynamicColor(light: lightPaletteModel.warningMild.color.get(), dark: darkPaletteModel.warningMild.color.get()))
            disabled = try Color(UIColor.dynamicColor(light: lightPaletteModel.disabled.color.get(), dark: darkPaletteModel.disabled.color.get()))
        }
    }
    
    public struct Text {
        public let primary: PrimaryText
        public let secondary: SecondaryText
        public let function: FunctionText
        public let interaction: InteractionText
        
        init(lightPaletteModel: ThemeModel.Text, darkPaletteModel: ThemeModel.Text) throws {
            primary = try PrimaryText(lightPaletteModel: lightPaletteModel.primary, darkPaletteModel: darkPaletteModel.primary)
            secondary = try SecondaryText(lightPaletteModel: lightPaletteModel.secondary, darkPaletteModel: darkPaletteModel.secondary)
            function = try FunctionText(lightPaletteModel: lightPaletteModel.function, darkPaletteModel: darkPaletteModel.function)
            interaction = try InteractionText(lightPaletteModel: lightPaletteModel.interaction, darkPaletteModel: darkPaletteModel.interaction)
        }
    }
    
    public struct PrimaryText {
        public let one: Color
        public let two: Color
        public let three: Color
        public let brand: Color
        
        init(lightPaletteModel: ThemeModel.PrimaryText, darkPaletteModel: ThemeModel.PrimaryText) throws {
            one = try Color(UIColor.dynamicColor(light: lightPaletteModel.one.color.get(), dark: darkPaletteModel.one.color.get()))
            two = try Color(UIColor.dynamicColor(light: lightPaletteModel.two.color.get(), dark: darkPaletteModel.two.color.get()))
            three = try Color(UIColor.dynamicColor(light: lightPaletteModel.three.color.get(), dark: darkPaletteModel.three.color.get()))
            brand = try Color(UIColor.dynamicColor(light: lightPaletteModel.brand.color.get(), dark: darkPaletteModel.brand.color.get()))
        }
    }
    
    public struct SecondaryText {
        public let one: Color
        
        init(lightPaletteModel: ThemeModel.SecondaryText, darkPaletteModel: ThemeModel.SecondaryText) throws {
            one = try Color(UIColor.dynamicColor(light: lightPaletteModel.one.color.get(), dark: darkPaletteModel.one.color.get()))
        }
    }
    
    public struct FunctionText {
        public let noteworthy: Color
        public let important: Color
        public let success: Color
        public let error: Color
        public let warningCritical: Color
        public let warningImportant: Color
        public let warningMild: Color
        public let disabled: Color
        
        init(lightPaletteModel: ThemeModel.FunctionText, darkPaletteModel: ThemeModel.FunctionText) throws {
            noteworthy = try Color(UIColor.dynamicColor(light: lightPaletteModel.noteworthy.color.get(), dark: darkPaletteModel.noteworthy.color.get()))
            important = try Color(UIColor.dynamicColor(light: lightPaletteModel.important.color.get(), dark: darkPaletteModel.important.color.get()))
            success = try Color(UIColor.dynamicColor(light: lightPaletteModel.success.color.get(), dark: darkPaletteModel.success.color.get()))
            error = try Color(UIColor.dynamicColor(light: lightPaletteModel.error.color.get(), dark: darkPaletteModel.error.color.get()))
            warningCritical = try Color(UIColor.dynamicColor(light: lightPaletteModel.warningCritical.color.get(), dark: darkPaletteModel.warningCritical.color.get()))
            warningImportant = try Color(UIColor.dynamicColor(light: lightPaletteModel.warningImportant.color.get(), dark: darkPaletteModel.warningImportant.color.get()))
            warningMild = try Color(UIColor.dynamicColor(light: lightPaletteModel.warningMild.color.get(), dark: darkPaletteModel.warningMild.color.get()))
            disabled = try Color(UIColor.dynamicColor(light: lightPaletteModel.disabled.color.get(), dark: darkPaletteModel.disabled.color.get()))
        }
    }
    
    public struct InteractionText {
        public let primaryOne: Color
        public let primaryTwo: Color
        public let positive: Color
        public let neutral: Color
        public let negative: Color
        public let textLink: Color
        
        init(lightPaletteModel: ThemeModel.InteractionText, darkPaletteModel: ThemeModel.InteractionText) throws {
            primaryOne = try Color(UIColor.dynamicColor(light: lightPaletteModel.primaryOne.color.get(), dark: darkPaletteModel.primaryOne.color.get()))
            primaryTwo = try Color(UIColor.dynamicColor(light: lightPaletteModel.primaryTwo.color.get(), dark: darkPaletteModel.primaryTwo.color.get()))
            positive = try Color(UIColor.dynamicColor(light: lightPaletteModel.positive.color.get(), dark: darkPaletteModel.positive.color.get()))
            neutral = try Color(UIColor.dynamicColor(light: lightPaletteModel.neutral.color.get(), dark: darkPaletteModel.neutral.color.get()))
            negative = try Color(UIColor.dynamicColor(light: lightPaletteModel.negative.color.get(), dark: darkPaletteModel.negative.color.get()))
            textLink = try Color(UIColor.dynamicColor(light: lightPaletteModel.textLink.color.get(), dark: darkPaletteModel.textLink.color.get()))
        }
    }
    
    public struct Icons {
        public let universal: Universal
        public let inButtons: InButtons
        
        init(lightPaletteModel: ThemeModel.Icons, darkPaletteModel: ThemeModel.Icons) throws {
            universal = try Universal(lightPaletteModel: lightPaletteModel.universal, darkPaletteModel: darkPaletteModel.universal)
            inButtons = try InButtons(lightPaletteModel: lightPaletteModel.inButtons, darkPaletteModel: darkPaletteModel.inButtons)
        }
    }
    
    public struct Universal {
        public let brand: Color
        public let secondaryBrand: Color
        public let strong: Color
        public let mid: Color
        public let strongReverse: Color
        public let noteworthy: Color
        public let important: Color
        public let success: Color
        public let error: Color
        public let warningCritical: Color
        public let warningImportant: Color
        public let warningMild: Color
        public let disabled: Color
        
        init(lightPaletteModel: ThemeModel.Universal, darkPaletteModel: ThemeModel.Universal) throws {
            brand = try Color(UIColor.dynamicColor(light: lightPaletteModel.brand.color.get(), dark: darkPaletteModel.brand.color.get()))
            secondaryBrand = try Color(UIColor.dynamicColor(light: lightPaletteModel.secondaryBrand.color.get(), dark: darkPaletteModel.secondaryBrand.color.get()))
            strong = try Color(UIColor.dynamicColor(light: lightPaletteModel.strong.color.get(), dark: darkPaletteModel.strong.color.get()))
            mid = try Color(UIColor.dynamicColor(light: lightPaletteModel.mid.color.get(), dark: darkPaletteModel.mid.color.get()))
            strongReverse = try Color(UIColor.dynamicColor(light: lightPaletteModel.strongReverse.color.get(), dark: darkPaletteModel.strongReverse.color.get()))
            noteworthy = try Color(UIColor.dynamicColor(light: lightPaletteModel.noteworthy.color.get(), dark: darkPaletteModel.noteworthy.color.get()))
            important = try Color(UIColor.dynamicColor(light: lightPaletteModel.important.color.get(), dark: darkPaletteModel.important.color.get()))
            success = try Color(UIColor.dynamicColor(light: lightPaletteModel.success.color.get(), dark: darkPaletteModel.success.color.get()))
            error = try Color(UIColor.dynamicColor(light: lightPaletteModel.error.color.get(), dark: darkPaletteModel.error.color.get()))
            warningCritical = try Color(UIColor.dynamicColor(light: lightPaletteModel.warningCritical.color.get(), dark: darkPaletteModel.warningCritical.color.get()))
            warningImportant = try Color(UIColor.dynamicColor(light: lightPaletteModel.warningImportant.color.get(), dark: darkPaletteModel.warningImportant.color.get()))
            warningMild = try Color(UIColor.dynamicColor(light: lightPaletteModel.warningMild.color.get(), dark: darkPaletteModel.warningMild.color.get()))
            disabled = try Color(UIColor.dynamicColor(light: lightPaletteModel.disabled.color.get(), dark: darkPaletteModel.disabled.color.get()))
        }
    }
    
    public struct InButtons {
        public let primaryOne: Color
        public let primaryTwo: Color
        public let positive: Color
        public let neutral: Color
        public let negative: Color
        
        init(lightPaletteModel: ThemeModel.InButtons, darkPaletteModel: ThemeModel.InButtons) throws {
            primaryOne = try Color(UIColor.dynamicColor(light: lightPaletteModel.primaryOne.color.get(), dark: darkPaletteModel.primaryOne.color.get()))
            primaryTwo = try Color(UIColor.dynamicColor(light: lightPaletteModel.primaryTwo.color.get(), dark: darkPaletteModel.primaryTwo.color.get()))
            positive = try Color(UIColor.dynamicColor(light: lightPaletteModel.positive.color.get(), dark: darkPaletteModel.positive.color.get()))
            neutral = try Color(UIColor.dynamicColor(light: lightPaletteModel.neutral.color.get(), dark: darkPaletteModel.neutral.color.get()))
            negative = try Color(UIColor.dynamicColor(light: lightPaletteModel.negative.color.get(), dark: darkPaletteModel.negative.color.get()))
        }
    }
    
    public struct Interaction {
        public let fill: InteractionModel
        public let stroke: InteractionModel
        
        init(lightPaletteModel: ThemeModel.Interaction, darkPaletteModel: ThemeModel.Interaction) throws {
            fill = try InteractionModel(lightPaletteModel: lightPaletteModel.fill, darkPaletteModel: darkPaletteModel.fill)
            stroke = try InteractionModel(lightPaletteModel: lightPaletteModel.stroke, darkPaletteModel: darkPaletteModel.stroke)
        }
    }
    
    public struct InteractionModel {
        public let primaryOne: Color
        public let primaryTwo: Color
        public let positive: Color
        public let neutralOne: Color
        public let neutralTwo: Color
        public let negative: Color
        public let floating: Color
        public let fillSubtle: Color
        public let focus: Color
        public let focusSoft: Color
        public let brand: Color
        public let strong: Color
        public let disabled: Color
        public let hoverState: Color
        public let clickState: Color
        
        init(lightPaletteModel: ThemeModel.InteractionModel, darkPaletteModel: ThemeModel.InteractionModel) throws {
            primaryOne = try Color(UIColor.dynamicColor(light: lightPaletteModel.primaryOne.color.get(), dark: darkPaletteModel.primaryOne.color.get()))
            primaryTwo = try Color(UIColor.dynamicColor(light: lightPaletteModel.primaryTwo.color.get(), dark: darkPaletteModel.primaryTwo.color.get()))
            positive = try Color(UIColor.dynamicColor(light: lightPaletteModel.positive.color.get(), dark: darkPaletteModel.positive.color.get()))
            neutralOne = try Color(UIColor.dynamicColor(light: lightPaletteModel.neutralOne.color.get(), dark: darkPaletteModel.neutralOne.color.get()))
            neutralTwo = try Color(UIColor.dynamicColor(light: lightPaletteModel.neutralTwo.color.get(), dark: darkPaletteModel.neutralTwo.color.get()))
            negative = try Color(UIColor.dynamicColor(light: lightPaletteModel.negative.color.get(), dark: darkPaletteModel.negative.color.get()))
            floating = try Color(UIColor.dynamicColor(light: lightPaletteModel.floating.color.get(), dark: darkPaletteModel.floating.color.get()))
            fillSubtle = try Color(UIColor.dynamicColor(light: lightPaletteModel.fillSubtle.color.get(), dark: darkPaletteModel.fillSubtle.color.get()))
            focus = try Color(UIColor.dynamicColor(light: lightPaletteModel.focus.color.get(), dark: darkPaletteModel.focus.color.get()))
            focusSoft = try Color(UIColor.dynamicColor(light: lightPaletteModel.focusSoft.color.get(), dark: darkPaletteModel.focusSoft.color.get()))
            brand = try Color(UIColor.dynamicColor(light: lightPaletteModel.brand.color.get(), dark: darkPaletteModel.brand.color.get()))
            strong = try Color(UIColor.dynamicColor(light: lightPaletteModel.strong.color.get(), dark: darkPaletteModel.strong.color.get()))
            disabled = try Color(UIColor.dynamicColor(light: lightPaletteModel.disabled.color.get(), dark: darkPaletteModel.disabled.color.get()))
            hoverState = try Color(UIColor.dynamicColor(light: lightPaletteModel.hoverState.color.get(), dark: darkPaletteModel.hoverState.color.get()))
            clickState = try Color(UIColor.dynamicColor(light: lightPaletteModel.clickState.color.get(), dark: darkPaletteModel.clickState.color.get()))
        }
    }
    
    public struct JourneyDiagram {
        public let future: Color
        public let present: Color
        public let past: Color
        public let cancelled: Color
        public let liveLocation: Color
        
        init(lightPaletteModel: ThemeModel.JourneyDiagram, darkPaletteModel: ThemeModel.JourneyDiagram) throws {
            future = try Color(UIColor.dynamicColor(light: lightPaletteModel.future.color.get(), dark: darkPaletteModel.future.color.get()))
            present = try Color(UIColor.dynamicColor(light: lightPaletteModel.present.color.get(), dark: darkPaletteModel.present.color.get()))
            past = try Color(UIColor.dynamicColor(light: lightPaletteModel.past.color.get(), dark: darkPaletteModel.past.color.get()))
            cancelled = try Color(UIColor.dynamicColor(light: lightPaletteModel.cancelled.color.get(), dark: darkPaletteModel.cancelled.color.get()))
            liveLocation = try Color(UIColor.dynamicColor(light: lightPaletteModel.liveLocation.color.get(), dark: darkPaletteModel.liveLocation.color.get()))
        }
    }
    
    public struct SpotColours {
        public let signalling: Signalling
        public let ticketStub: TicketStub
        public let splitTicket: SplitTicket
        public let co2: CO2
        public let cheapestBanner: CheapestBanner
        
        init(lightPaletteModel: ThemeModel.SpotColours, darkPaletteModel: ThemeModel.SpotColours) throws {
            signalling = try Signalling(lightPaletteModel: lightPaletteModel.signalling, darkPaletteModel: darkPaletteModel.signalling)
            ticketStub = try TicketStub(lightPaletteModel: lightPaletteModel.ticketStub, darkPaletteModel: darkPaletteModel.ticketStub)
            splitTicket = try SplitTicket(lightPaletteModel: lightPaletteModel.splitTicket, darkPaletteModel: darkPaletteModel.splitTicket)
            co2 = try CO2(lightPaletteModel: lightPaletteModel.co2, darkPaletteModel: darkPaletteModel.co2)
            cheapestBanner = try CheapestBanner(lightPaletteModel: lightPaletteModel.cheapestBanner, darkPaletteModel: darkPaletteModel.cheapestBanner)
        }
    }
    
    public struct Signalling {
        public let positiveResult: Color
        public let negativeResult: Color
        
        init(lightPaletteModel: ThemeModel.Signalling, darkPaletteModel: ThemeModel.Signalling) throws {
            positiveResult = try Color(UIColor.dynamicColor(light: lightPaletteModel.positiveResult.color.get(), dark: darkPaletteModel.positiveResult.color.get()))
            negativeResult = try Color(UIColor.dynamicColor(light: lightPaletteModel.negativeResult.color.get(), dark: darkPaletteModel.negativeResult.color.get()))
        }
    }
    
    public struct TicketStub {
        public let fill: Color
        public let iconOne: Color
        public let iconTwo: Color
        
        init(lightPaletteModel: ThemeModel.TicketStub, darkPaletteModel: ThemeModel.TicketStub) throws {
            fill = try Color(UIColor.dynamicColor(light: lightPaletteModel.fill.color.get(), dark: darkPaletteModel.fill.color.get()))
            iconOne = try Color(UIColor.dynamicColor(light: lightPaletteModel.iconOne.color.get(), dark: darkPaletteModel.iconOne.color.get()))
            iconTwo = try Color(UIColor.dynamicColor(light: lightPaletteModel.iconTwo.color.get(), dark: darkPaletteModel.iconTwo.color.get()))
        }
    }
    
    public struct SplitTicket {
        public let main: Color
        public let one: Color
        public let two: Color
        public let three: Color
        public let four: Color
        
        init(lightPaletteModel: ThemeModel.SplitTicket, darkPaletteModel: ThemeModel.SplitTicket) throws {
            main = try Color(UIColor.dynamicColor(light: lightPaletteModel.main.color.get(), dark: darkPaletteModel.main.color.get()))
            one = try Color(UIColor.dynamicColor(light: lightPaletteModel.one.color.get(), dark: darkPaletteModel.one.color.get()))
            two = try Color(UIColor.dynamicColor(light: lightPaletteModel.two.color.get(), dark: darkPaletteModel.two.color.get()))
            three = try Color(UIColor.dynamicColor(light: lightPaletteModel.three.color.get(), dark: darkPaletteModel.three.color.get()))
            four = try Color(UIColor.dynamicColor(light: lightPaletteModel.four.color.get(), dark: darkPaletteModel.four.color.get()))
        }
    }
    
    public struct CO2 {
        public let mainText: Color
        public let one: Color
        public let two: Color
        public let three: Color
        public let car: Color
        public let plane: Color
        
        init(lightPaletteModel: ThemeModel.CO2, darkPaletteModel: ThemeModel.CO2) throws {
            mainText = try Color(UIColor.dynamicColor(light: lightPaletteModel.mainText.color.get(), dark: darkPaletteModel.mainText.color.get()))
            one = try Color(UIColor.dynamicColor(light: lightPaletteModel.one.color.get(), dark: darkPaletteModel.one.color.get()))
            two = try Color(UIColor.dynamicColor(light: lightPaletteModel.two.color.get(), dark: darkPaletteModel.two.color.get()))
            three = try Color(UIColor.dynamicColor(light: lightPaletteModel.three.color.get(), dark: darkPaletteModel.three.color.get()))
            car = try Color(UIColor.dynamicColor(light: lightPaletteModel.car.color.get(), dark: darkPaletteModel.car.color.get()))
            plane = try Color(UIColor.dynamicColor(light: lightPaletteModel.plane.color.get(), dark: darkPaletteModel.plane.color.get()))
        }
    }
    
    public struct CheapestBanner {
        public let fill: Color
        public let text: Color
        public let stroke: Color
        
        init(lightPaletteModel: ThemeModel.CheapestBanner, darkPaletteModel: ThemeModel.CheapestBanner) throws {
            fill = try Color(UIColor.dynamicColor(light: lightPaletteModel.fill.color.get(), dark: darkPaletteModel.fill.color.get()))
            text = try Color(UIColor.dynamicColor(light: lightPaletteModel.text.color.get(), dark: darkPaletteModel.text.color.get()))
            stroke = try Color(UIColor.dynamicColor(light: lightPaletteModel.stroke.color.get(), dark: darkPaletteModel.stroke.color.get()))
        }
    }
    
    public struct SeatMaps {
        public let floor: Floor
        public let optionItems: OptionItems
        public let amenities: Amenities
        
        init(lightPaletteModel: ThemeModel.SeatMaps, darkPaletteModel: ThemeModel.SeatMaps) throws {
            floor = try Floor(lightPaletteModel: lightPaletteModel.floor, darkPaletteModel: darkPaletteModel.floor)
            optionItems = try OptionItems(lightPaletteModel: lightPaletteModel.optionItems, darkPaletteModel: darkPaletteModel.optionItems)
            amenities = try Amenities(lightPaletteModel: lightPaletteModel.amenities, darkPaletteModel: darkPaletteModel.amenities)
        }
    }
    
    public struct Floor {
        public let neutral: Color
        public let content: Color
        public let coachStroke: Color
        
        init(lightPaletteModel: ThemeModel.Floor, darkPaletteModel: ThemeModel.Floor) throws {
            neutral = try Color(UIColor.dynamicColor(light: lightPaletteModel.neutral.color.get(), dark: darkPaletteModel.neutral.color.get()))
            content = try Color(UIColor.dynamicColor(light: lightPaletteModel.content.color.get(), dark: darkPaletteModel.content.color.get()))
            coachStroke = try Color(UIColor.dynamicColor(light: lightPaletteModel.coachStroke.color.get(), dark: darkPaletteModel.coachStroke.color.get()))
        }
    }
    
    public struct OptionItems {
        public let baseDefault: Color
        public let baseHover: Color
        public let baseSelected: Color
        public let baseUnavailable: Color
        public let strokeDefault: Color
        public let strokeHover: Color
        public let strokeSelected: Color
        public let strokeUnavailable: Color
        public let primaryIconDefault: Color
        public let primaryIconHover: Color
        public let primaryIconSelected: Color
        public let primaryIconUnavailable: Color
        public let secondaryIconOrText: Color
        
        init(lightPaletteModel: ThemeModel.OptionItems, darkPaletteModel: ThemeModel.OptionItems) throws {
            baseDefault = try Color(UIColor.dynamicColor(light: lightPaletteModel.baseDefault.color.get(), dark: darkPaletteModel.baseDefault.color.get()))
            baseHover = try Color(UIColor.dynamicColor(light: lightPaletteModel.baseHover.color.get(), dark: darkPaletteModel.baseHover.color.get()))
            baseSelected = try Color(UIColor.dynamicColor(light: lightPaletteModel.baseSelected.color.get(), dark: darkPaletteModel.baseSelected.color.get()))
            baseUnavailable = try Color(UIColor.dynamicColor(light: lightPaletteModel.baseUnavailable.color.get(), dark: darkPaletteModel.baseUnavailable.color.get()))
            strokeDefault = try Color(UIColor.dynamicColor(light: lightPaletteModel.strokeDefault.color.get(), dark: darkPaletteModel.strokeDefault.color.get()))
            strokeHover = try Color(UIColor.dynamicColor(light: lightPaletteModel.strokeHover.color.get(), dark: darkPaletteModel.strokeHover.color.get()))
            strokeSelected = try Color(UIColor.dynamicColor(light: lightPaletteModel.strokeSelected.color.get(), dark: darkPaletteModel.strokeSelected.color.get()))
            strokeUnavailable = try Color(UIColor.dynamicColor(light: lightPaletteModel.strokeUnavailable.color.get(), dark: darkPaletteModel.strokeUnavailable.color.get()))
            primaryIconDefault = try Color(UIColor.dynamicColor(light: lightPaletteModel.primaryIconDefault.color.get(), dark: darkPaletteModel.primaryIconDefault.color.get()))
            primaryIconHover = try Color(UIColor.dynamicColor(light: lightPaletteModel.primaryIconHover.color.get(), dark: darkPaletteModel.primaryIconHover.color.get()))
            primaryIconSelected = try Color(UIColor.dynamicColor(light: lightPaletteModel.primaryIconSelected.color.get(), dark: darkPaletteModel.primaryIconSelected.color.get()))
            primaryIconUnavailable = try Color(UIColor.dynamicColor(light: lightPaletteModel.primaryIconUnavailable.color.get(), dark: darkPaletteModel.primaryIconUnavailable.color.get()))
            secondaryIconOrText = try Color(UIColor.dynamicColor(light: lightPaletteModel.secondaryIconOrText.color.get(), dark: darkPaletteModel.secondaryIconOrText.color.get()))
        }
    }
    
    public struct Amenities {
        public let one: Color
        public let two: Color
        
        init(lightPaletteModel: ThemeModel.Amenities, darkPaletteModel: ThemeModel.Amenities) throws {
            one = try Color(UIColor.dynamicColor(light: lightPaletteModel.one.color.get(), dark: darkPaletteModel.one.color.get()))
            two = try Color(UIColor.dynamicColor(light: lightPaletteModel.two.color.get(), dark: darkPaletteModel.two.color.get()))
        }
    }
}
