//
//  OutcomeTextView.swift
//  Tic Tac Toe Aficionado
//
//  Created by Jonathan Huston on 1/21/21.
//

import SwiftUI

struct OutcomeTextView {
    let piece: String
    let outcome: Int
}

extension OutcomeTextView: View {
    var body: some View {
        HStack {
            Text("\(piece):")
                .frame(width: 22 * Device.scaling)
            Text("\(outcome)")
        }
    }
}

struct OutcomeTextView_Previews: PreviewProvider {
    static var previews: some View {
        OutcomeTextView(piece: "X", outcome: 15000)
    }
}
