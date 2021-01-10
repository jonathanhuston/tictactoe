//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

class Game: ObservableObject {
    @Published var board = newBoard(size: 3)
    @Published var players = 2
    @Published var playing = Piece.X
    @Published var computerTurn = false
    @Published var computerMove = (0, 0)
    @Published var remaining = 9
    @Published var winner: Piece? = nil
    @Published var launch = true
}

@main
struct TicTacToeApp: App {
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(Game())
        }
    }
}
