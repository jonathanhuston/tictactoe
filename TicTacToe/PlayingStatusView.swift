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
        switch game.playing {
        case Piece.X:
            Text("Player X's turn")
                .font(.title)
                .foregroundColor(.primary)
        case Piece.O:
            Text("Player O's turn")
                .font(.title)
                .foregroundColor(.primary)
        default:
            EmptyView()
        }
    }
}

struct PlayingStatusView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingStatusView()
            .environmentObject(Game())
    }
}
