//
//  WinnerStatusView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct WinnerStatusView {
    @EnvironmentObject var game: Game
    
    var winningPlayer: Piece
}

extension WinnerStatusView: View {
    var body: some View {
        switch winningPlayer {
        case Piece.X:
            Text("PLAYER X WINS!")
                .font(.title)
                .foregroundColor(.red)
        case Piece.O:
            Text("PLAYER O WINS!")
                .font(.title)
                .foregroundColor(.blue)
        case Piece.empty:
            Text("IT'S A TIE!")
                .font(.title)
                .foregroundColor(.primary)
        }
    }
}

struct WinnerStatusView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerStatusView(winningPlayer: Piece.X)
            .environmentObject(Game())
    }
}
