//
//  TrainControlsView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/11/21.
//

import SwiftUI

struct TrainControlsView {
    @EnvironmentObject var game: Game
    @EnvironmentObject var screenScaling: ScreenScaling
}

extension TrainControlsView: View {
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
                    game.train = false
                }
                
                CounterView(text: counterText)
                
                Button("Reset") {
                    Library.reset()
                    game.trainingCounter = 0
                    game.train = false
                }
                
                if screenScaling.factor >= 1 {
                    DummyPicker()
                }
            }
            .padding()
        }
    }
}

struct TrainControlsView_Previews: PreviewProvider {
    static var previews: some View {
        TrainControlsView()
            .environmentObject(Game())
            .environmentObject(ScreenScaling())
    }
}
