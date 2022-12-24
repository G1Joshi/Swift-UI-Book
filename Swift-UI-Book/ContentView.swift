//
//  ContentView.swift
//  Swift-UI-Book
//
//  Created by Jeevan Chandra Joshi on 24/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ButtonView()
                .tabItem {
                    Text("Button")
                    Image(systemName: "square.and.pencil")
                }
            CheckboxView()
                .tabItem {
                    Text("Checkbox")
                    Image(systemName: "checkmark.square")
                }
            SliderView()
                .tabItem {
                    Text("Slider")
                    Image(systemName: "slider.horizontal.3")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
