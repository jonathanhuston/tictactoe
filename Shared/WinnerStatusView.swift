//
//  WinnerStatusView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct WinnerStatusView {
    @EnvironmentObject var game: Game
}

extension WinnerStatusView: View {
    var body: some View {
        switch game.winner {
        case .X:
            Text("PLAYER X WINS!")
                .statusModifier(color: .red)
        case .O:
            Text("PLAYER O WINS!")
                .statusModifier(color: .blue)
        default:
            Text("IT'S A TIE!")
                .statusModifier(color: .primary)
        }
    }
}

struct WinnerStatusView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerStatusView()
            .environmentObject(Game())
    }
}
