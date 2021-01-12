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
        if game.player == .X {
            Text("Player X's turn")
                .font(.title)
                .foregroundColor(.primary)
                .hidden(game.launch)
        } else {
            Text("Player O's turn")
                .font(.title)
                .foregroundColor(.primary)
        }
    }
}

struct PlayingStatusView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingStatusView()
            .environmentObject(Game())
    }
}
