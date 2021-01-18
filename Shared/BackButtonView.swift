//
//  BackButtonView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/18/21.
//

import SwiftUI

struct BackButtonView {
    @EnvironmentObject var game: Game
}

extension BackButtonView: View {
    var body: some View {
        Button(action: {
            game.takeBackMove()
        }) {
            Image(systemName: "arrow.backward")
                .frame(width: 75)
        }
        .disabled(game.computerTurn
                    || game.moves.isEmpty
                    || game.computerFirstMove())
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
            .environmentObject(Game())
    }
}
