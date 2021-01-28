//
//  GameView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct GameView {
    @EnvironmentObject var game: Game
}

extension GameView: View {
    var body: some View {
        VStack {
            BoardView()
            ControlsView()
        }
        .onAppear() {
            if game.launch && game.fullyTrained() {
                LibraryLogic.populate(using: game)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(Game())
    }
}
