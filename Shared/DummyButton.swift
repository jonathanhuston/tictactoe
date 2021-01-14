//
//  DummyButton.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/15/21.
//

import SwiftUI

struct DummyButton: View {
    var body: some View {
        Button(" ") {
        }
        .hidden()
    }
}

struct DummyButton_Previews: PreviewProvider {
    static var previews: some View {
        DummyButton()
    }
}
