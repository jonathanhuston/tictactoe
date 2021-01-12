//
//  DummyPicker.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/12/21.
//

import SwiftUI

struct DummyPicker {
        @State private var dummy = ""
}

extension DummyPicker: View {
    var body: some View {
        Picker("", selection: $dummy) {
        }
        .pickerStyle(DefaultPickerStyle())
        .frame(width: 0)
        .hidden()
    }
}

struct DummyPicker_Previews: PreviewProvider {
    static var previews: some View {
        DummyPicker()
    }
}
