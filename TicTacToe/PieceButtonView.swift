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
            if game.board[row][col] == Piece.empty && game.winner == nil {
                humanMove(in: game, row: row, col: col)
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
