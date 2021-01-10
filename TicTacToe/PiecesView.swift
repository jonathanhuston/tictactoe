//
//  PiecesView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct PiecesView {
    @EnvironmentObject var game: Game
}

extension PiecesView: View {
    var body: some View {
        
        VStack(spacing: 20) {
            ForEach(game.board.indices, id:\.self) {row in
                HStack(spacing: 20) {
                    ForEach(game.board[row].indices, id:\.self) {col in
                        if game.computerTurn && game.computerMove == (row, col) && game.winner == nil {
                            PieceImageView(row: row, col: col)
                        } else {
                            PieceButtonView(row: row, col: col)
                        }
                    }
                }
            }
        }
    }
}

struct PiecesView_Previews: PreviewProvider {
    static var previews: some View {
        PiecesView()
            .environmentObject(Game())
    }
}
