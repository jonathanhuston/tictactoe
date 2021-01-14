//
//  ScoreToggleView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/14/21.
//

import SwiftUI

struct ScoreToggleView {
    @EnvironmentObject var game: Game
}

extension ScoreToggleView: View {
    var body: some View {
        HStack {
            DummyPicker()
            
            Toggle(isOn: $game.showScores) {
                Text("Show hints")
            }
            
            DummyPicker()
        }
        .padding()
    }
}

struct ScoreToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreToggleView()
            .environmentObject(Game())
    }
}
