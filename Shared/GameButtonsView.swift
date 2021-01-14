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
    var extraSpacing = false
}

extension GameButtonsView: View {
    var body: some View {
        HStack(spacing: extraSpacing ? 60 : 20) {
            Button("Play") {
//                Library.reset()
                
                game.launch = false
                
                switch newGameType {
                case "Computer vs. Computer":
                    game.newGame(players: 0)
                case "Computer vs. Human":
                    game.newGame(players: 1, computerTurn: true)
                case "Human vs. Computer":
                    game.newGame(players: 1, computerTurn: false)
                case "Human vs. Human":
                    game.newGame(players: 2)
                default:
                    game.newGame(players: 0, train: true)
                }
            }
            
            Button("Quit") {
                exit(0)
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
