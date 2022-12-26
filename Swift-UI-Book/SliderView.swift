//
//  SliderView.swift
//  Swift-UI-Book
//
//  Created by Jeevan Chandra Joshi on 24/12/22.
//

import SwiftUI

struct SliderView: View {
    @State var sliderSize = SliderSize.medium
    @State var sliderColor = SliderColor.blue
    @State var isEnabled = true
    @State var value = 0.5

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Slider(value: $value, in: 0 ... 1)
                    .padding(sliderSize.padding)
                    .tint(sliderColor.color)
                    .disabled(!isEnabled)
                Spacer()
                Form {
                    HStack {
                        Text("Size ")
                        Picker("Size", selection: $sliderSize) {
                            ForEach(SliderSize.allCases, id: \.self) { size in
                                Text(size.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    Toggle("Enabled", isOn: $isEnabled)
                    Picker("Color", selection: $sliderColor) {
                        ForEach(SliderColor.allCases, id: \.self) { color in
                            Text(color.rawValue)
                        }
                    }
                }
                .frame(height: geometry.size.height / 2)
            }
        }
    }
}

enum SliderSize: String, CaseIterable {
    case small, medium, large
}

enum SliderColor: String, CaseIterable {
    case red, blue, orange, purple, green
}

extension SliderSize {
    var padding: Double {
        switch self {
        case .small:
            return 150
        case .medium:
            return 100
        case .large:
            return 50
        }
    }
}

extension SliderColor {
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

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
