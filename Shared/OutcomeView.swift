//
//  OutcomeView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/17/21.
//

import SwiftUI

struct OutcomeView {
    let outcomes: [Player: Int]
}

extension OutcomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            OutcomeTextView(piece: "X", outcome: outcomes[.X]!)
            OutcomeTextView(piece: "O", outcome: outcomes[.O]!)
            OutcomeTextView(piece: "-", outcome: outcomes[.none]!)
        }
        .scoreModifier(size: 20)
    }
}

struct OutcomeView_Previews: PreviewProvider {
    static var previews: some View {
        OutcomeView(outcomes: [.X: 131184, .O: 77904, .none: 46080])
    }
}
