//
//  GameDefinitions.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

enum Player {
    case X
    case O
    case none
}

func nextPlayer(_ player: Player) -> Player {
    player == .X ? .O : .X
}

typealias Board = [Player]

let newBoard: Board = Array(repeating: Player.none, count: 9)

func square(_ row: Int, _ col: Int) -> Move {
    row * 3 + col
}

typealias Move = Int

let allMoves = Set<Move>(0...8)

typealias Score = Int8

let gameTypes = ["Computer vs. Computer", "Computer vs. Human", "Human vs. Computer", "Human vs. Human", "Train", "Train all games"]

let winningConstellations = [ Set<Move>([0, 1, 2]),
                              Set<Move>([3, 4, 5]),
                              Set<Move>([6, 7, 8]),
                              Set<Move>([0, 3, 6]),
                              Set<Move>([1, 4, 7]),
                              Set<Move>([2, 5, 8]),
                              Set<Move>([0, 4, 8]),
                              Set<Move>([2, 4, 6]) ]

let uniqueGames = 255168

let transformations: [[Move]] = [ [0, 1, 2, 3, 4, 5, 6, 7, 8],
                                  [2, 1, 0, 5, 4, 3, 8, 7, 6],
                                  [6, 7, 8, 3, 4, 5, 0, 1, 2],
                                  [6, 3, 0, 7, 4, 1, 8, 5, 2],
                                  [2, 5, 8, 1, 4, 7, 0, 3, 6],
                                  [8, 7, 6, 5, 4, 3, 2, 1, 0],
                                  [0, 3, 6, 1, 4, 7, 2, 5, 8],
                                  [8, 5, 2, 7, 4, 1, 6, 3, 0] ]

func symmetries(of moves: [Move]) -> [[Move]] {
    transformations.map ({ (transformation) -> [Move] in
        moves.map { transformation[$0] }
    })
}
