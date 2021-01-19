//
//  StatusView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct StatusView {
    @EnvironmentObject var game: Game
}

extension StatusView: View {
    var body: some View {
        if game.populate {
            PopulateStatusView()
        } else {
            HStack() {
                BackButtonView()
                    .hidden(game.players == 0)
                    .disabled(game.computerTurn
                                || game.moves.isEmpty
                                || game.computerFirstMove())
                
                if game.winner == nil {
                    PlayingStatusView()
                } else {
                    WinnerStatusView()
                }
                
                ForwardButtonView()
                    .hidden(game.players == 0)
                    .disabled(game.computerTurn
                                || game.movesTakenBack.isEmpty)
            }
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
            .environmentObject(Game())
    }
}
