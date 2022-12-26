//
//  CheckboxView.swift
//  Swift-UI-Book
//
//  Created by Jeevan Chandra Joshi on 24/12/22.
//

import SwiftUI

struct CheckboxView: View {
    @State var checkboxSize = CheckboxSize.medium
    @State var checkboxColor = CheckboxColor.blue
    @State var checkboxIcon = CheckboxVariant.square
    @State var isChecked = false
    @State var isEnabled = true
    @State var isLabel = true

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Button {
                    isChecked.toggle()
                } label: {
                    HStack {
                        Image(systemName: isChecked ? checkboxIcon.fill : checkboxIcon.icon)
                        if isLabel {
                            Text("I accept the T&C")
                        }
                    }
                }
                .font(checkboxSize.font)
                .tint(checkboxColor.color)
                .disabled(!isEnabled)
                Spacer()
                Form {
                    HStack {
                        Text("Size ")
                        Picker("Size", selection: $checkboxSize) {
                            ForEach(CheckboxSize.allCases, id: \.self) { size in
                                Text(size.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    Toggle("Enabled", isOn: $isEnabled)
                    Toggle("Label", isOn: $isLabel)
                    Picker("Icon", selection: $checkboxIcon) {
                        ForEach(CheckboxVariant.allCases, id: \.self) { icon in
                            Text(icon.rawValue)
                        }
                    }
                    Picker("Color", selection: $checkboxColor) {
                        ForEach(CheckboxColor.allCases, id: \.self) { color in
                            Text(color.rawValue)
                        }
                    }
                }
                .frame(height: geometry.size.height / 2)
            }
        }
    }
}

enum CheckboxSize: String, CaseIterable {
    case small, medium, large
}

enum CheckboxColor: String, CaseIterable {
    case red, blue, orange, purple, green
}

enum CheckboxVariant: String, CaseIterable {
    case seal, square, circle, rectangle, diamond
}

extension CheckboxSize {
    var font: Font {
        switch self {
        case .small:
            return .footnote
        case .medium:
            return .headline
        case .large:
            return .title
        }
    }
}

extension CheckboxColor {
    var color: Color {
        switch self {
        case .red:
            return .red
        case .blue:
            return .blue
        case .orange:
            return .orange
        case .purple:
            return .purple
        case .green:
            return .green
        }
    }
}

extension CheckboxVariant {
    var icon: String {
        switch self {
        case .seal:
            return "seal"
        case .square:
            return "square"
        case .circle:
            return "circle"
        case .rectangle:
            return "rectangle"
        case .diamond:
            return "diamond"
        }
    }

    var fill: String {
        switch self {
        case .seal:
            return "checkmark.seal.fill"
        case .square:
            return "checkmark.square.fill"
        case .circle:
            return "checkmark.circle.fill"
        case .rectangle:
            return "checkmark.rectangle.fill"
        case .diamond:
            return "checkmark.diamond.fill"
        }
    }
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView()
    }
}
