//
//  GameButtonsView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct GameControlsView {
    @EnvironmentObject var game: Game
    
    private let gameTypes = ["Computer vs. Computer", "Computer vs. Human", "Human vs. Computer", "Human vs. Human", "Train"]
    @State private var newGameType = "Computer vs. Computer"
}

extension GameControlsView: View {
    var body: some View {
        HStack(spacing: 20) {
            Picker("", selection: $newGameType) {
                ForEach(gameTypes, id:\.self) { gameType in
                    Text("\(gameType)")
                }
            }
            .pickerStyle(DefaultPickerStyle())
            .frame(width: 185)
                
            Button(action: {
                game.launch = false
                
                switch newGameType {
                case "Computer vs. Computer":
                    newGame(game, players: 0)
                case "Computer vs. Human":
                    newGame(game, players: 1, computerTurn: true)
                case "Human vs. Computer":
                    newGame(game, players: 1, computerTurn: false)
                case "Human vs. Human":
                    newGame(game, players: 2)
                default:
                    newGame(game, players: 0, train: true)
                }
            }) {
                if game.launch {
                    Text("Play")
                } else {
                    Text("Play again?")
                }
            }
            
            Button(action: {
                exit(0)
            }) {
                Text("Quit")
            }
        }
        .hidden(game.winner == nil && !game.launch)
        .padding()
    }
}

struct GameButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        GameControlsView()
            .environmentObject(Game())
    }
}
