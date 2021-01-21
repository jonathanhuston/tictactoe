//
//  GameButtonsView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/12/21.
//

import SwiftUI

struct GameButtonsView {
    @EnvironmentObject var game: Game
    @Binding var newGameType: String
}

extension GameButtonsView: View {
    var body: some View {
        HStack(spacing: Device.iOS ? 60 : 20) {
            Button("Play") {
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
                case "Train":
                    game.newGame(players: 0, train: true)
                 default:
                    LibraryLogic.populate(using: game)
                    newGameType = gameTypes.first!
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
        GameButtonsView(newGameType: .constant("Computer vs. Computer"))
            .environmentObject(Game())
    }
}
