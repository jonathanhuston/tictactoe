//
//  Tic_Tac_ToeApp.swift
//  Shared
//
//  Created by Jonathan Huston on 1/12/21.
//

import SwiftUI

class Game: ObservableObject {
    @AppStorage("library") var library = Library().encode()!
    @AppStorage("gamesTrained") var gamesTrained = 0

    @Published var board = newBoard
    @Published var player: Player = .X
    @Published var winner: Player? = nil
    @Published var launch = true
    @Published var train = false
    @Published var populate = false
    @Published var showScores = false
    @Published var showOutcomes = false
    @Published var currentScores = [Score?]()
    
    var libraryCache = Library()
    var moves = [Move]()
    var movesTakenBack = [Move]()
    var players = 2
    var computerTurn = false
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
