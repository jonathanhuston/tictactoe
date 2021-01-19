//
//  PlayingStatusView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct PlayingStatusView {
    @EnvironmentObject var game: Game
}

extension PlayingStatusView: View {
    var body: some View {
        Text(game.player == .X ? "Player X's turn" : "Player O's turn")
            .statusModifier(color: .primary)
    }
}

struct PlayingStatusView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingStatusView()
            .environmentObject(Game())
    }
}
