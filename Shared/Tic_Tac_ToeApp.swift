//
//  Tic_Tac_ToeApp.swift
//  Shared
//
//  Created by Jonathan Huston on 1/12/21.
//

import SwiftUI

class Game: ObservableObject {
    @AppStorage("library") var library = Library().encode()!
    @AppStorage("trainingCounter") var trainingCounter = 0

    @Published var board = newBoard(size: 3)
    @Published var player: Player = .X
    @Published var winner: Player? = nil
    @Published var launch = true
    @Published var train = false
    
    var moves = [Move]()
    var players = 2
    var computerTurn = false
    var remaining = 9
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