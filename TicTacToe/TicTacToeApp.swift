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
    @Published var remaining = 9
    @Published var winner: Piece? = nil
}

@main
struct TicTacToeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Game())
        }
    }
}
