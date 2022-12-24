//
//  CheckboxView.swift
//  Swift-UI-Book
//
//  Created by Jeevan Chandra Joshi on 24/12/22.
//

import SwiftUI

struct CheckboxView: View {
    @State var isChecked = false

    var body: some View {
        Button {
            isChecked = !isChecked
        } label: {
            HStack {
                Image(systemName: isChecked ? "checkmark.square" : "square")
                Text("I accept the terms & conditions")
            }
        }
    }
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxView()
    }
}
