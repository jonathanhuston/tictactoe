//
//  StatusView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct StatusView {
    @EnvironmentObject var game: Game
}

extension StatusView: View {
    var body: some View {
        if game.winner == nil {
            PlayingStatusView()
        } else {
            WinnerStatusView(winningPlayer: game.winner!)
        }
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
            .environmentObject(Game())
    }
}
