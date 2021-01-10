//
//  GameButtonsView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct GameControlsView {
    @EnvironmentObject var game: Game
    
    private let gameTypes = ["Human vs. Human", "Computer vs. Human", "Human vs. Computer", "Computer vs. Computer"]
    @State private var newGameType = "Human vs. Human"
}

extension GameControlsView: View {
    var body: some View {
        HStack(spacing: 20) {
            Picker("", selection: $newGameType) {
                ForEach(gameTypes, id:\.self) { gameType in
                    Text("\(gameType)")
                }
            }
            .pickerStyle(MenuPickerStyle())
            .frame(width: 185)
            .hidden(game.winner == nil && !game.launch)
                
            Button(action: {
                game.launch = false
                
                switch newGameType {
                case "Human vs. Human":
                    newGame(game, players: 2)
                case "Computer vs. Human":
                    newGame(game, players: 1, computerTurn: true)
                case "Human vs. Computer":
                    newGame(game, players: 1, computerTurn: false)
                default:
                    newGame(game, players: 0)
                }
            }) {
                if game.launch {
                    Text("Play")
                } else {
                    Text("Play again?")
                }
            }
            .hidden(game.winner == nil && !game.launch)
            
            Button(action: {
                exit(0)
            }) {
                Text("Quit")
            }
            .hidden(game.winner == nil && !game.launch)
        }
        .padding()
    }
}

struct GameButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        GameControlsView()
            .environmentObject(Game())
    }
}
