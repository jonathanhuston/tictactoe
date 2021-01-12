//
//  Tic_Tac_ToeApp.swift
//  Shared
//
//  Created by Jonathan Huston on 1/12/21.
//

import SwiftUI

class Game: ObservableObject {
    @AppStorage("library") var library = newLibrary()
    @AppStorage("trainingCounter") var trainingCounter = 0

    @Published var board = newBoard()
    @Published var player: Player = .X
    @Published var winner: Player? = nil
    @Published var launch = true
    @Published var train = false
    
    var moves = [Move]()
    var players = 2
    var computerTurn = false
    var possibleMoves: Set = [0, 1, 2, 3, 4, 5, 6, 7, 8]
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
