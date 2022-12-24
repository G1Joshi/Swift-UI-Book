//
//  SliderView.swift
//  Swift-UI-Book
//
//  Created by Jeevan Chandra Joshi on 24/12/22.
//

import SwiftUI

struct SliderView: View {
    @State var value = 0.5

    var body: some View {
        Slider(value: $value, in: 0 ... 1)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
