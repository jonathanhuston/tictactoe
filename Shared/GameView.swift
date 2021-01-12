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
}

extension GameView: View {
    var body: some View {
        VStack {
            ZStack {
                GridView()
                
                if !game.launch {
                    PiecesView()
                }
            }
        
            StatusView()
            
            if !game.train {
                GameControlsView()
            } else {
                TrainControlsView()
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
