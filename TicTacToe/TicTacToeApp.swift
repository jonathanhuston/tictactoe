//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI


class Game: ObservableObject {
    @Published var board = newBoard(size: 3)
    @Published var player: Player = .X
    @Published var winner: Player? = nil
    @Published var launch = true
    @Published var train = false
    
    @AppStorage("trainingCounter") var trainingCounter = 0
    var library = Library()
    
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
