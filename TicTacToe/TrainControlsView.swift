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
            Button(action: {
                game.train = false
            }) {
                Text("Stop training")
            }
            
            Button(action: {
                exit(0)
            }) {
                Text("Quit")
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
