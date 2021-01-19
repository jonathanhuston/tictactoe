//
//  PieceImageView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct PieceImageView {
    @EnvironmentObject var game: Game

    @State var row = 0
    @State var col = 0
    
    let width: CGFloat = 140
    let height: CGFloat = 140
}

extension PieceImageView: View {
    var body: some View {
        ZStack {
            Color.primary.colorInvert()
                .frame(width: width * Device.scaling, height: height * Device.scaling)
            
            switch game.board[square(row, col)] {
            case .X:
                Image(systemName: "xmark")
                    .font(.system(size: 125 * Device.scaling, weight: .regular))
                    .foregroundColor(.red)
            case .O:
                Image(systemName: "circle")
                    .font(.system(size: 100 * Device.scaling, weight: .medium))
                    .foregroundColor(.blue)
            case .none:
                if game.showScores && !game.computerTurn {
                        ScoresView(row: row, col: col)
                }
            }
        }
    }
}

struct PieceImageView_Previews: PreviewProvider {
    static var previews: some View {
        PieceImageView(row: 0, col: 0)
            .environmentObject(Game())
    }
}
