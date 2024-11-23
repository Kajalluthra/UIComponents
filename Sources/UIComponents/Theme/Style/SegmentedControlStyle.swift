import SwiftUI

public struct SegmentedControlStyle {
    let selectedFill: Color
    let selectedStroke: Color
    let selectedText: Color
    let unselectedFill: Color
    let unselectedText: Color
    let containerStroke: Color
}

extension SegmentedControlStyle {
    public static let dark = SegmentedControlStyle(selectedFill: ThemePalette.base.theme.appSecondaryBackgroundOne,
                                            selectedStroke: ThemePalette.interaction.stroke.brand,
                                            selectedText: ThemePalette.text.function.success,
                                                   unselectedFill: ThemePalette.base.containerFill.dominant,
                                            unselectedText: ThemePalette.text.secondary.one,
                                            containerStroke: .clear)
    
    public static let lightPrimary = SegmentedControlStyle(selectedFill: ThemePalette.base.containerFill.primary,
                                                    selectedStroke: ThemePalette.interaction.stroke.brand,
                                                    selectedText: ThemePalette.text.function.success,
                                                    unselectedFill: ThemePalette.base.theme.primaryBackground,
                                                    unselectedText: ThemePalette.text.primary.three,
                                                    containerStroke: ThemePalette.base.containerStroke.defaultStroke)
    
    public static let lightSecondary = SegmentedControlStyle(selectedFill: ThemePalette.base.containerFill.secondary,
                                                      selectedStroke: ThemePalette.interaction.stroke.focus,
                                                      selectedText: ThemePalette.text.primary.one,
                                                      unselectedFill: ThemePalette.base.containerFill.primary,
                                                    unselectedText: ThemePalette.text.primary.three,
                                                    containerStroke: ThemePalette.base.containerStroke.defaultStroke)
}
