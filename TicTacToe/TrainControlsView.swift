//
//  TrainControlsView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/11/21.
//

import SwiftUI

struct TrainControlsView {
    @EnvironmentObject var game: Game
}

extension TrainControlsView: View {
    var body: some View {
        HStack(spacing: 20) {
            Text("\(game.trainingCounter) \(game.trainingCounter == 1 ? "game" : "games") trained")
                .frame(width: 140)
                .font(.title3)
                .foregroundColor(.purple)
            
            Button(action: {
                game.train = false
            }) {
                Text("Stop training")
            }
        }
        .padding()
    }
}

struct TrainControlsView_Previews: PreviewProvider {
    static var previews: some View {
        TrainControlsView()
            .environmentObject(Game())
    }
}
