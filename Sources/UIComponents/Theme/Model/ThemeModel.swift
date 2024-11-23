import Foundation

/// Represents the structure of theme JSON files so that they may be parsed.
struct ThemeModel: Decodable {
    let base: Base
    let text: Text
    let icons: Icons
    let interaction: Interaction
    let journeyDiagram: JourneyDiagram
    let spotColours: SpotColours
    let seatMaps: SeatMaps
    
    enum CodingKeys: String, CodingKey {
        case base = "Base"
        case text = "Text"
        case icons = "Icons"
        case interaction = "Interaction"
        case journeyDiagram = "Journey_Diagram"
        case spotColours = "SpotColours"
        case seatMaps = "SeatMaps"
    }
    
    struct Base: Decodable {
        let theme: BaseTheme
        let fill: ContainerFill
        let stroke: ContainerStroke
        
        enum CodingKeys: String, CodingKey {
            case theme = "Theme"
            case fill = "Container-Fill"
            case stroke = "Container-Stroke"
        }
    }
    
    struct BaseTheme: Decodable {
        let navigation: ThemeColorModel
        let primaryBackground: ThemeColorModel
        let appSecondaryBackgroundOne: ThemeColorModel
        let appSecondaryBackgroundTwo: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case navigation = "Navigation"
            case primaryBackground = "PrimaryBackground"
            case appSecondaryBackgroundOne = "SecondaryBackground_1"
            case appSecondaryBackgroundTwo = "SecondaryBackground_2"
        }
    }
    
    struct ContainerFill: Decodable {
        let primary: ThemeColorModel
        let secondary: ThemeColorModel
        let strong: ThemeColorModel
        let dominant: ThemeColorModel
        let forms: ThemeColorModel
        let noteworthy: ThemeColorModel
        let important: ThemeColorModel
        let positive: ThemeColorModel
        let error: ThemeColorModel
        let warningCritical: ThemeColorModel
        let warningImportant: ThemeColorModel
        let warningMild: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case primary = "Primary"
            case secondary = "Secondary"
            case strong = "Strong"
            case dominant = "Dominant"
            case forms = "Forms"
            case noteworthy = "Noteworthy"
            case important = "Important"
            case positive = "Success"
            case error = "Error"
            case warningCritical = "Warning-Critical"
            case warningImportant = "Warning-Important"
            case warningMild = "Warning-Mild"
        }
    }
    
    struct ContainerStroke: Decodable {
        let `default`: ThemeColorModel
        let forms: ThemeColorModel
        let focus: ThemeColorModel
        let divider: ThemeColorModel
        let noteworthy: ThemeColorModel
        let important: ThemeColorModel
        let success: ThemeColorModel
        let error: ThemeColorModel
        let warningCritical: ThemeColorModel
        let warningImportant: ThemeColorModel
        let warningMild: ThemeColorModel
        let disabled: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case `default` = "Default"
            case forms = "Forms"
            case focus = "Focus"
            case divider = "Divider"
            case noteworthy = "Noteworthy"
            case important = "Important"
            case success = "Success"
            case error = "Error"
            case warningCritical = "Warning-Critical"
            case warningImportant = "Warning-Important"
            case warningMild = "Warning-Mild"
            case disabled = "Disabled"
        }
    }
    
    struct Text: Decodable {
        let primary: PrimaryText
        let secondary: SecondaryText
        let function: FunctionText
        let interaction: InteractionText
        
        enum CodingKeys: String, CodingKey {
            case primary = "Primary"
            case secondary = "Secondary"
            case function = "Function"
            case interaction = "Interaction"
        }
    }
    
    struct PrimaryText: Decodable {
        let one: ThemeColorModel
        let two: ThemeColorModel
        let three: ThemeColorModel
        let brand: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case one = "1"
            case two = "2"
            case three = "3"
            case brand = "Brand"
        }
    }
    
    struct SecondaryText: Decodable {
        let one: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case one = "1"
        }
    }
    
    struct FunctionText: Decodable {
        let noteworthy: ThemeColorModel
        let important: ThemeColorModel
        let success: ThemeColorModel
        let error: ThemeColorModel
        let warningCritical: ThemeColorModel
        let warningImportant: ThemeColorModel
        let warningMild: ThemeColorModel
        let disabled: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case noteworthy = "Noteworthy"
            case important = "Important"
            case success = "Success"
            case error = "Error"
            case warningCritical = "Warning-Critical"
            case warningImportant = "Warning-Important"
            case warningMild = "Warning-mild"
            case disabled = "Disabled"
        }
    }
    
    struct InteractionText: Decodable {
        let primaryOne: ThemeColorModel
        let primaryTwo: ThemeColorModel
        let positive: ThemeColorModel
        let neutral: ThemeColorModel
        let negative: ThemeColorModel
        let textLink: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case primaryOne = "Primary_1"
            case primaryTwo = "Primary_2"
            case positive = "Positive"
            case neutral = "Neutral"
            case negative = "Negative"
            case textLink = "TextLink"
        }
    }
    
    struct Icons: Decodable {
        let universal: Universal
        let inButtons: InButtons
        
        enum CodingKeys: String, CodingKey {
            case universal = "Universal"
            case inButtons = "InButtons"
        }
    }
    
    struct Universal: Decodable {
        let brand: ThemeColorModel
        let secondaryBrand: ThemeColorModel
        let strong: ThemeColorModel
        let mid: ThemeColorModel
        let strongReverse: ThemeColorModel
        let noteworthy: ThemeColorModel
        let important: ThemeColorModel
        let success: ThemeColorModel
        let error: ThemeColorModel
        let warningCritical: ThemeColorModel
        let warningImportant: ThemeColorModel
        let warningMild: ThemeColorModel
        let disabled: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case brand = "Brand"
            case secondaryBrand = "Secondary-Brand"
            case strong = "Strong"
            case mid = "Mid"
            case strongReverse = "Reverse"
            case noteworthy = "Noteworthy"
            case important = "Important"
            case success = "Sucess"
            case error = "Error"
            case warningCritical = "Warning-Critical"
            case warningImportant = "Warning-Important"
            case warningMild = "Warning-Mild"
            case disabled = "Disabled"
        }
    }
    
    struct InButtons: Decodable {
        let primaryOne: ThemeColorModel
        let primaryTwo: ThemeColorModel
        let positive: ThemeColorModel
        let neutral: ThemeColorModel
        let negative: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case primaryOne = "Primary_1"
            case primaryTwo = "Primary_2"
            case positive = "Positive"
            case neutral = "Neutral"
            case negative = "Negative"
        }
    }
    
    struct Interaction: Decodable {
        let fill: InteractionModel
        let stroke: InteractionModel
        
        enum CodingKeys: String, CodingKey {
            case fill = "Fill"
            case stroke = "Stroke"
        }
    }
    
    struct InteractionModel: Decodable {
        let primaryOne: ThemeColorModel
        let primaryTwo: ThemeColorModel
        let positive: ThemeColorModel
        let neutralOne: ThemeColorModel
        let neutralTwo: ThemeColorModel
        let negative: ThemeColorModel
        let floating: ThemeColorModel
        let fillSubtle: ThemeColorModel
        let focus: ThemeColorModel
        let focusSoft: ThemeColorModel
        let brand: ThemeColorModel
        let strong: ThemeColorModel
        let disabled: ThemeColorModel
        let hoverState: ThemeColorModel
        let clickState: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case primaryOne = "Primary_1"
            case primaryTwo = "Primary_2"
            case neutralOne = "Neutral-1"
            case neutralTwo = "Neutral-2"
            case fillSubtle = "Subtle"
            case hoverState = "Hover"
            case clickState = "Pressed"
            case floating = "Floating"
            case focusSoft = "Focus-Soft"
            case focus = "Focus"
            case strong = "Strong"
            case disabled = "Disabled"
            case brand = "Brand"
            case positive = "Positive"
            case negative = "Negative"
        }
    }
    
    struct JourneyDiagram: Decodable {
        let future: ThemeColorModel
        let present: ThemeColorModel
        let past: ThemeColorModel
        let cancelled: ThemeColorModel
        let liveLocation: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case future = "Future"
            case present = "Present"
            case past = "Past"
            case cancelled = "Cancelled"
            case liveLocation = "Live_Location"
        }
    }
    
    struct SpotColours: Decodable {
        let signalling: Signalling
        let ticketStub: TicketStub
        let splitTicket: SplitTicket
        let co2: CO2
        let cheapestBanner: CheapestBanner
        
        enum CodingKeys: String, CodingKey {
            case signalling = "Signalling"
            case ticketStub = "TicketStub"
            case splitTicket = "SplitTicket"
            case co2 = "CO2"
            case cheapestBanner = "Cheapset_Banner"
        }
    }
    
    struct Signalling: Decodable {
        let positiveResult: ThemeColorModel
        let negativeResult: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case positiveResult = "PositiveResult"
            case negativeResult = "NegativeResult"
        }
    }
    
    struct TicketStub: Decodable {
        let fill: ThemeColorModel
        let iconOne: ThemeColorModel
        let iconTwo: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case fill = "Fill"
            case iconOne = "Icon1"
            case iconTwo = "Icon2"
        }
    }
    
    struct SplitTicket: Decodable {
        let main: ThemeColorModel
        let one: ThemeColorModel
        let two: ThemeColorModel
        let three: ThemeColorModel
        let four: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case main = "Main"
            case one = "1"
            case two = "2"
            case three = "3"
            case four = "4"
        }
    }
    
    struct CO2: Decodable {
        let mainText: ThemeColorModel
        let one: ThemeColorModel
        let two: ThemeColorModel
        let three: ThemeColorModel
        let car: ThemeColorModel
        let plane: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case mainText = "Main_Text"
            case one = "1"
            case two = "2"
            case three = "3"
            case car = "Car"
            case plane = "Plane"
        }
    }
    
    struct CheapestBanner: Decodable {
        let fill: ThemeColorModel
        let text: ThemeColorModel
        let stroke: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case fill = "Fill"
            case text = "Text"
            case stroke = "Stroke"
        }
    }
    
    struct SeatMaps: Decodable {
        let floor: Floor
        let optionItems: OptionItems
        let amenities: Amenities
        
        enum CodingKeys: String, CodingKey {
            case floor = "Floor"
            case optionItems = "Option_Items"
            case amenities = "Amenities"
        }
    }
    
    struct Floor: Decodable {
        let neutral: ThemeColorModel
        let content: ThemeColorModel
        let coachStroke: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case neutral = "Neutral"
            case content = "Content"
            case coachStroke = "Coach-Stroke"
        }
    }
    
    struct OptionItems: Decodable {
        let baseDefault: ThemeColorModel
        let baseHover: ThemeColorModel
        let baseSelected: ThemeColorModel
        let baseUnavailable: ThemeColorModel
        let strokeDefault: ThemeColorModel
        let strokeHover: ThemeColorModel
        let strokeSelected: ThemeColorModel
        let strokeUnavailable: ThemeColorModel
        let primaryIconDefault: ThemeColorModel
        let primaryIconHover: ThemeColorModel
        let primaryIconSelected: ThemeColorModel
        let primaryIconUnavailable: ThemeColorModel
        let secondaryIconOrText: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case baseDefault = "Base-Default"
            case baseHover = "Base-Hover"
            case baseSelected = "Base-Selected"
            case baseUnavailable = "Base-Unavailable"
            case strokeDefault = "Stroke-Default"
            case strokeHover = "Stroke-Hover"
            case strokeSelected = "Stroke-Selected"
            case strokeUnavailable = "Stroke-Unavailable"
            case primaryIconDefault = "Primary_Icon-Default"
            case primaryIconHover = "Primary_Icon-Hover"
            case primaryIconSelected = "Primary_Icon-Selected"
            case primaryIconUnavailable = "Primary_Icon-Unavailable"
            case secondaryIconOrText = "SecondaryIconOrText"
        }
    }
    
    struct Amenities: Decodable {
        let one: ThemeColorModel
        let two: ThemeColorModel
        
        enum CodingKeys: String, CodingKey {
            case one = "1"
            case two = "2"
        }
    }
}
