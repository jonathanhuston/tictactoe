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
                TrainingView()
            } else if game.players != 0 && game.inProgress() {
                PlayingView()
            } else {
                GameSelectionView(newGameType: $newGameType)
                    .hidden(game.populate || game.inProgress())
            }
        }
        .frame(height: 650 * Device.scaling)
        .onAppear(perform: {
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
