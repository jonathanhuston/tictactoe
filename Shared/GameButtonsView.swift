//
//  GameButtonsView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/12/21.
//

import SwiftUI

struct GameButtonsView {
    @EnvironmentObject var game: Game
    var newGameType: String
}

extension GameButtonsView: View {
    var body: some View {
        HStack {
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
                Text("Play")
            }
            
            Button(action: {
                exit(0)
            }) {
                Text("Quit")
            }
        }
    }
}

struct GameButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        GameButtonsView(newGameType: "Computer vs. Computer")
            .environmentObject(Game())
    }
}
