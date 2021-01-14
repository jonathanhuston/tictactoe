//
//  ScoreToggleView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/14/21.
//

import SwiftUI

struct ScoreToggleView {
    @EnvironmentObject var game: Game
    @EnvironmentObject var screenScaling: ScreenScaling
}

extension ScoreToggleView: View {
    var body: some View {
        VStack {
            HStack {
                DummyPicker()
                
                Toggle(isOn: $game.showScores) {
                    Text("Show hints")
                }
                .fixedSize()
                
                DummyPicker()
            }
            .padding()
            
            if screenScaling.factor < 1 {
                DummyButton()
            }
        }
    }
}

struct ScoreToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreToggleView()
            .environmentObject(Game())
            .environmentObject(ScreenScaling())
    }
}
