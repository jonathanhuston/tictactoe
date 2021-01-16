//
//  PopulateControlsView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/16/21.
//

import SwiftUI

struct PopulateControlsView {
    @EnvironmentObject var game: Game
    @EnvironmentObject var screenScaling: ScreenScaling
}

extension PopulateControlsView: View {
    var body: some View {
        let counterText = (game.trainingCounter < uniqueGames)
            ? "\(game.trainingCounter) \(game.trainingCounter == 1 ? "game" : "games") trained"
            : "Training complete"

        VStack(spacing: 0) {
            if screenScaling.factor < 1 {
                DummyPicker()
            }
            
            HStack() {
                Button("Suspend") {
                    game.populate = false
                }
                
                CounterView(text: counterText)
                
                Button("Reset") {
                    Library.reset()
                    game.trainingCounter = 0
                    game.populate = false
                }
                
                if screenScaling.factor >= 1 {
                    DummyPicker()
                }
            }
            .padding()
        }
    }
}

struct PopulateControlsView_Previews: PreviewProvider {
    static var previews: some View {
        PopulateControlsView()
            .environmentObject(Game())
            .environmentObject(ScreenScaling())
    }
}
