//
//  GameSelectionView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct GameSelectionView {
    @EnvironmentObject var game: Game
    @Binding var newGameType: String
}

extension GameSelectionView: View {
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
                
                if Device.iPhone {
                    GameButtonsView(newGameType: $newGameType)
                }
            }

            if !Device.iPhone {
                GameButtonsView(newGameType: $newGameType)
            }
        }
        .padding()
    }
}

struct GameControlsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSelectionView(newGameType: .constant("Computer vs. Computer"))
            .environmentObject(Game())
    }
}
