//
//  GameControlsView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct GameControlsView {
    @EnvironmentObject var game: Game
    @EnvironmentObject var screenScaling: ScreenScaling
    
    private let gameTypes = ["Computer vs. Computer", "Computer vs. Human", "Human vs. Computer", "Human vs. Human", "Train"]
    @State private var newGameType = "Computer vs. Computer"
}

extension GameControlsView: View {
    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Picker("", selection: $newGameType) {
                    ForEach(gameTypes, id:\.self) { gameType in
                        Text("\(gameType)")
                    }
                }
                .pickerStyle(DefaultPickerStyle())
                .fixedSize()
                
                if screenScaling.factor < 1 {
                    GameButtonsView(newGameType: newGameType, extraSpacing: true)
                }
            }

            if screenScaling.factor >= 1 {
                GameButtonsView(newGameType: newGameType)
            }
        }
        .hidden(game.winner == nil && !game.launch)
        .padding()
    }
}

struct GameControlsView_Previews: PreviewProvider {
    static var previews: some View {
        GameControlsView()
            .environmentObject(Game())
            .environmentObject(ScreenScaling())
    }
}
