//
//  WinnerStatusView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct WinnerStatusView {
    @EnvironmentObject var game: Game
    
    var winningPlayer: Player
}

extension WinnerStatusView: View {
    var body: some View {
        switch winningPlayer {
        case .X:
            Text("PLAYER X WINS!")
                .font(.title)
                .foregroundColor(.red)
        case .O:
            Text("PLAYER O WINS!")
                .font(.title)
                .foregroundColor(.blue)
        case .none:
            Text("IT'S A TIE!")
                .font(.title)
                .foregroundColor(.primary)
        }
    }
}

struct WinnerStatusView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerStatusView(winningPlayer: .X)
            .environmentObject(Game())
    }
}
