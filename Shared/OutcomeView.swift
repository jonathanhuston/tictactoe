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
            Text("X:\t\(outcomes[.X]!)")
            Text("O:\t\(outcomes[.O]!)")
            Text("–:\t\(outcomes[.none]!)")
        }
        .font(.title3)
        .foregroundColor(.purple)
        .opacity(0.7)
    }
}

struct OutcomeView_Previews: PreviewProvider {
    static var previews: some View {
        OutcomeView(outcomes: [.X: 131184, .O: 77904, .none: 46080])
    }
}
