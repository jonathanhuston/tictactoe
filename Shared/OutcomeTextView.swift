//
//  OutcomeTextView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/21/21.
//

import SwiftUI

struct OutcomeTextView {
    var piece: String
    var outcome: Int
}

extension OutcomeTextView: View {
    var body: some View {
        HStack {
            Text("\(piece):")
                .frame(width: 20 * Device.scaling)
            Text("\(outcome)")
        }
    }
}

struct OutcomeTextView_Previews: PreviewProvider {
    static var previews: some View {
        OutcomeTextView(piece: "X", outcome: 15000)
    }
}
