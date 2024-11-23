import SwiftUI

public struct RoundedSegmentedControl: View {

    @Binding var selectedIndex: Int
    public var options: [String]
    public var style: SegmentedControlStyle

    public init(selectedIndex: Binding<Int>, options: [String], style: SegmentedControlStyle) {
        _selectedIndex = selectedIndex
        self.options = options
        self.style = style
    }

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .stroke(style.containerStroke, lineWidth: 1)
            HStack(spacing: 0) {
                ForEach(options.indices, id: \.self) { index in
                    let isSelected = selectedIndex == index
                    ZStack {
                        Rectangle()
                            .fill(style.unselectedFill)
                        RoundedRectangle(cornerRadius: 100)
                            .fill(style.selectedFill)
                            .opacity(isSelected ? 1 : 0.01)
                            .onTapGesture {
                                withAnimation(.interactiveSpring(response: 0.2,
                                                                 dampingFraction: 2,
                                                                 blendDuration: 0.5)) {
                                    selectedIndex = index
                                }
                            }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 100)
                            .stroke(isSelected ? style.selectedStroke : .clear, lineWidth: 1)
                            .padding(1)
                    )
                    .overlay(
                        Text(options[index])
                            .foregroundStyle(isSelected ? style.selectedText : style.unselectedText)
                            .font(.buttonT3)
                    )
                }
            }
            .cornerRadius(100)
        }
        .frame(height: 38)
    }
}

struct RoundedSegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        let styles: [SegmentedControlStyle] = [
            .dark,
            .lightPrimary,
            .lightSecondary
        ]
        return VStack {
            ForEach(Array(styles.enumerated()), id: \.offset) { _, style in
                RoundedSegmentedControl(selectedIndex: .constant(0), options: ["Departures", "Arrivals"], style: style)
            }
        }
        .padding()
        .setupUIComponents()
    }
}
