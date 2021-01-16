//
//  GameView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct GameView {
    @EnvironmentObject var game: Game
    @EnvironmentObject var screenScaling: ScreenScaling
    
    @State private var newGameType = "Computer vs. Computer"
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
            } else {
                if game.players != 0 && !game.launch && game.winner == nil {
                    ScoreToggleView()
                } else {
                    GameControlsView(newGameType: $newGameType)
                }
            }
        }
        .frame(height: 650 * screenScaling.factor)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(Game())
            .environmentObject(ScreenScaling())
    }
}
