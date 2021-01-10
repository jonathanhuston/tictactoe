//
//  SinglePieceView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct SinglePieceView {
    @EnvironmentObject var game: Game

    @State var row = 0
    @State var col = 0
    
    var width: CGFloat = 140
    var height: CGFloat = 140
}

extension SinglePieceView: View {
    var body: some View {
        Button(action: {
            if game.board[row][col] == Piece.empty && game.winner == nil {
                game.board[row][col] = game.playing
                game.remaining -= 1
                game.winner = winner(game)
                game.playing = nextPlayer(player: game.playing)
            }
        }) {
            ZStack {
                Color.primary.colorInvert()
                    .frame(width: width, height: height)
                
                switch game.board[row][col] {
                case .X:
                    Image(systemName: "xmark")
                        .font(.system(size: 125, weight: .regular))
                        .foregroundColor(.red)
                case .O:
                    Image(systemName: "circle")
                        .font(.system(size: 100, weight: .medium))
                        .foregroundColor(.blue)
                case .empty:
                    Text(" ")
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SinglePieceView_Previews: PreviewProvider {
    static var previews: some View {
        SinglePieceView(row: 0, col: 0)
            .environmentObject(Game())
    }
}
