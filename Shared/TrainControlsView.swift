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
                Button(action: {
                    game.train = false
                }) {
                    Text("Suspend")
                }
                
                if screenScaling.factor >= 1 {
                    Text(counterText)
                        .frame(width: 200)
                        .font(.title3)
                        .foregroundColor(.purple)
                } else {
                    Text(counterText)
                        .fixedSize()
                        .foregroundColor(.purple)
                }
                
                Button(action: {
                    Library.reset()
                    game.trainingCounter = 0
                    game.train = false
                }) {
                    Text("Reset")
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
