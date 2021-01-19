//
//  ScoresView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/14/21.
//

import SwiftUI

struct ScoresView {
    @EnvironmentObject var game: Game
    
    @State var row = 0
    @State var col = 0
}

extension ScoresView: View {
    var body: some View {
        if game.showScores && !game.computerTurn {
            if let score = game.currentScores[square(row, col)] {
                VStack(spacing: 5) {
                    switch score {
                    case 1:
                        Text("X")
                            .fontWeight(.bold)
                            .scoreModifier()
                    case -1:
                        Text("O")
                            .fontWeight(.bold)
                            .scoreModifier()
                    case 0:
                        Text("TIE")
                            .fontWeight(.bold)
                            .scoreModifier()
                    default:
                        Text("")
                    }
                    
                    if game.showOutcomes {
                        let outcomes = LibraryLogic.currentOutcomes(in: game, for: square(row, col))
                        OutcomeView(outcomes: outcomes)
                    }
                }
            }
        }
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
            .environmentObject(Game())
    }
}
