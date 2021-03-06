//
//  PieceButtonView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct PieceButtonView {
    @EnvironmentObject var game: Game

    let row: Int
    let col: Int
}

extension PieceButtonView: View {
    var body: some View {
        Button(action: {
            if game.board[square(row, col)] == .none && game.winner == nil {
                game.humanMove(row: row, col: col)
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
