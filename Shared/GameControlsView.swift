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
    @Binding var newGameType: String
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
                    GameSelectionView(newGameType: $newGameType, extraSpacing: true)
                }
            }

            if screenScaling.factor >= 1 {
                GameSelectionView(newGameType: $newGameType)
            }
        }
        .hidden(game.populate || (!game.launch && game.winner == nil))
        .padding()
    }
}

struct GameControlsView_Previews: PreviewProvider {
    static var previews: some View {
        GameControlsView(newGameType: .constant("Computer vs. Computer"))
            .environmentObject(Game())
            .environmentObject(ScreenScaling())
    }
}
