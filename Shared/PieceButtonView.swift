//
//  SinglePieceView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct PieceButtonView {
    @EnvironmentObject var game: Game

    @State var row = 0
    @State var col = 0
}

extension PieceButtonView: View {
    var body: some View {
        Button(action: {
            if game.board[row * 3 + col] == .none && game.winner == nil {
                humanMove(row: row, col: col, in: game)
            }
        }) {
            PieceImageView(row: row, col: col)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SinglePieceView_Previews: PreviewProvider {
    static var previews: some View {
        PieceButtonView(row: 0, col: 0)
            .environmentObject(Game())
    }
}
