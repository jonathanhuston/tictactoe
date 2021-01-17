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
        VStack(spacing: 20 * Device.scaling) {
            HStack(spacing: 20 * Device.scaling) {
                PieceButtonView(row: 0, col: 0)
                PieceButtonView(row: 0, col: 1)
                PieceButtonView(row: 0, col: 2)
            }
            
            HStack(spacing: 20 * Device.scaling) {
                PieceButtonView(row: 1, col: 0)
                PieceButtonView(row: 1, col: 1)
                PieceButtonView(row: 1, col: 2)
            }
            
            HStack(spacing: 20 * Device.scaling) {
                PieceButtonView(row: 2, col: 0)
                PieceButtonView(row: 2, col: 1)
                PieceButtonView(row: 2, col: 2)
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
