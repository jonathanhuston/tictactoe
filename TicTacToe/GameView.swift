//
//  GameView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct GameView {
    @EnvironmentObject var game: Game
}

extension GameView: View {
    var body: some View {
        VStack {
            ZStack {
                GridView()
                PiecesView()
            }
        
            StatusView()
            
            HStack(spacing: 20) {
                Button(action: {
                    newGame(game)
                }) {
                    Text("New game?")
                }
                .disabled(game.winner == nil)
                .opacity(game.winner == nil ? 0 : 1)
                
                Button(action: {
                    exit(0)
                }) {
                    Text("Quit")
                }
                .disabled(game.winner == nil)
                .opacity(game.winner == nil ? 0 : 1)
            }
            .padding()
        }
        .frame(height: 650)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(Game())
    }
}
