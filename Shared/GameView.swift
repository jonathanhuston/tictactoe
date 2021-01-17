//
//  GameView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct GameView {
    @EnvironmentObject var game: Game
    
    @State private var newGameType = gameTypes.first!
}

extension GameView: View {
    var body: some View {
        VStack {
            ZStack {
                GridView()
                
                if !game.launch && !game.populate {
                    PiecesView()
                }
            }
        
            StatusView()
                .hidden(game.launch)
            
            if game.train {
                TrainControlsView()
            } else if game.players != 0 && game.inProgress() {
                ScoreToggleView()
            } else {
                GameSelectionView(newGameType: $newGameType)
                    .hidden(game.populate || game.inProgress())
                    .padding()
            }
        }
        .frame(height: 650 * Device.scaling)
        .onAppear(perform: {
//            DEV:
//            LibraryLogic.reset()
            if game.launch && game.fullyTrained() {
                LibraryLogic.populate(using: game)
            }
        })
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(Game())
    }
}
