//
//  PieceImageView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct PieceImageView {
    @EnvironmentObject var game: Game
    @EnvironmentObject var screenScaling: ScreenScaling

    @State var row = 0
    @State var col = 0
    
    let width: CGFloat = 140
    let height: CGFloat = 140
}

extension PieceImageView: View {
    var body: some View {
        ZStack {
            Color.primary.colorInvert()
                .frame(width: width * screenScaling.factor, height: height * screenScaling.factor)
            
            switch game.board[row][col] {
            case .X:
                Image(systemName: "xmark")
                    .font(.system(size: 125 * screenScaling.factor, weight: .regular))
                    .foregroundColor(.red)
            case .O:
                Image(systemName: "circle")
                    .font(.system(size: 100 * screenScaling.factor, weight: .medium))
                    .foregroundColor(.blue)
            case .none:
                Text(" ")
            }
        }
    }
}

struct PieceImageView_Previews: PreviewProvider {
    static var previews: some View {
        PieceImageView(row: 0, col: 0)
            .environmentObject(Game())
            .environmentObject(ScreenScaling())
    }
}
