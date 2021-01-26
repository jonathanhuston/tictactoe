//
//  ControlsView.swift
//  Tic Tac Toe Aficionado
//
//  Created by Jonathan Huston on 1/21/21.
//

import SwiftUI

struct ControlsView {
    @EnvironmentObject var game: Game
    
    @State private var newGameType = gameTypes.first!
}

extension ControlsView: View {
    var body: some View {
        VStack {
            if game.train {
                TrainingView()
            } else if game.players != 0 && game.inProgress() {
                PlayingView()
            } else {
                GameSelectionView(newGameType: $newGameType)
                    .hidden(game.populate || game.inProgress())
            }
        }
        .frame(width: 280, height: Device.iOS ? 280 : 100)
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
            .environmentObject(Game())
    }
}
