//
//  ScoresView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/14/21.
//

import SwiftUI

struct ScoresView {
    @EnvironmentObject var game: Game
    @EnvironmentObject var screenScaling: ScreenScaling
    
    @State var row = 0
    @State var col = 0
}

extension ScoresView: View {
    var body: some View {
        if game.showScores && !game.computerTurn {
            if let score = game.currentScores[square(row, col)] {
                switch score {
                case 1:
                    Text("X")
                        .scoreModifier(reduce: screenScaling.factor < 1)
                case -1:
                    Text("O")
                        .scoreModifier(reduce: screenScaling.factor < 1)
                case 0:
                    Text("TIE")
                        .scoreModifier(reduce: screenScaling.factor < 1)
                default:
                    Text(" ")
                }
            }
        }
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
            .environmentObject(Game())
            .environmentObject(ScreenScaling())
    }
}
