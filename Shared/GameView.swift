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
        if !Device.iOS || Device.iOS && Device.portrait() {
            VStack {
                BoardView()
                ControlsView()
            }
        } else {
            HStack {
                BoardView()
                ControlsView()
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
