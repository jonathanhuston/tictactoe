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

    @Published var board = Game.newBoard()
    @Published var player: Player = .X
    @Published var winner: Player? = nil
    @Published var launch = true
    @Published var train = false
    @Published var populate = false
    @Published var showScores = false
    @Published var currentScores = [Score?]()
    
    var libraryCache = Library()
    var moves = [Move]()
    var possibleMoves = allMoves
    var players = 2
    var computerTurn = false
}

class ScreenScaling: ObservableObject {
    @Published var factor: CGFloat = (Device.width < 450) ? 0.7 : 1
}

@main
struct TicTacToeApp: App {
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(Game())
                .environmentObject(ScreenScaling())
        }
    }
}
