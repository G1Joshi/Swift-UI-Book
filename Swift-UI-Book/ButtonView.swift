//
//  ButtonView.swift
//  Swift-UI-Book
//
//  Created by Jeevan Chandra Joshi on 24/12/22.
//

import SwiftUI

struct ButtonView: View {
    @State var buttonSize = ButtonSize.medium
    @State var buttonColor = ButtonColor.blue
    @State var buttonVariant = ButtonVariant.solid
    @State var isEnabled = true
    @State var isPrefix = false
    @State var isSuffix = false
    @State var isLoading = false
    @State var isAlert = false

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                Button {
                    isAlert.toggle()
                } label: {
                    if isLoading {
                        HStack {
                            Text("Loading")
                            ProgressView()
                                .padding(.leading, 1)
                                .tint(.black)
                        }
                    } else {
                        HStack {
                            if isPrefix {
                                Image(systemName: "person")
                            }
                            Text("Click Me")
                            if isSuffix {
                                Image(systemName: "star")
                            }
                        }
                    }
                }
                .myButtonStyle(buttonVariant.variant)
                .font(buttonSize.font)
                .tint(buttonColor.color)
                .disabled(!isEnabled)
                .alert("You clicked me", isPresented: $isAlert, actions: {})
                Spacer()
                Form {
                    HStack {
                        Text("Size ")
                        Picker("Size", selection: $buttonSize) {
                            ForEach(ButtonSize.allCases, id: \.self) { size in
                                Text(size.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    Picker("Variant", selection: $buttonVariant) {
                        ForEach(ButtonVariant.allCases, id: \.self) { variant in
                            Text(variant.rawValue)
                        }
                    }
                    Picker("Color", selection: $buttonColor) {
                        ForEach(ButtonColor.allCases, id: \.self) { color in
                            Text(color.rawValue)
                        }
                    }
                    Toggle("Enabled", isOn: $isEnabled)
                    Toggle("Loading", isOn: $isLoading)
                    if !isLoading {
                        HStack {
                            Button {
                                isPrefix.toggle()
                            } label: {
                                HStack {
                                    Text("Prefix Icon")
                                    Image(systemName: isPrefix ? "checkmark.square" : "square")
                                }
                            }
                            .buttonStyle(.bordered)
                            Spacer()
                            Button {
                                isSuffix.toggle()
                            } label: {
                                HStack {
                                    Text("Suffix Icon")
                                    Image(systemName: isSuffix ? "checkmark.square" : "square")
                                }
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                }
                .frame(height: geometry.size.height / 2)
            }
        }
    }
}

enum ButtonSize: String, CaseIterable {
    case small, medium, large
}

enum ButtonColor: String, CaseIterable {
    case blue, gray, green, red, yellow
}

enum ButtonVariant: String, CaseIterable {
    case solid, subtle, plain
}

extension ButtonSize {
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

extension ButtonColor {
    var color: Color {
        switch self {
        case .blue:
            return .blue
        case .gray:
            return .gray
        case .green:
            return .green
        case .red:
            return .red
        case .yellow:
            return .yellow
        }
    }
}

extension ButtonVariant {
    var variant: ButtonVariant {
        switch self {
        case .solid:
            return ButtonVariant.solid
        case .subtle:
            return ButtonVariant.subtle
        case .plain:
            return ButtonVariant.plain
        }
    }
}

extension Button {
    @ViewBuilder
    func myButtonStyle(_ style: ButtonVariant) -> some View {
        switch style {
        case .solid:
            buttonStyle(BorderedProminentButtonStyle())
        case .subtle:
            buttonStyle(BorderedButtonStyle())
        case .plain:
            buttonStyle(BorderlessButtonStyle())
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
