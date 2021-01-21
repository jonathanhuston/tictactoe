//
//  PlayingView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/14/21.
//

import SwiftUI

struct PlayingView {
    @EnvironmentObject var game: Game
}

extension PlayingView: View {
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Toggle(isOn: $game.showScores) {
                    Text("Hints")
                }
                .fixedSize()
                
                Toggle(isOn: $game.showOutcomes) {
                    Text("Outcomes")
                }
                .fixedSize()
                .disabled(!game.showScores)
            }
            .padding()
        }
    }
}

struct ScoreToggleView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingView()
            .environmentObject(Game())
    }
}
