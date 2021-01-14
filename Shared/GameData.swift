//
//  GameData.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import Foundation

enum Player {
    case X
    case O
    case none
}

typealias Board = [Player]
typealias Move = Int

let allMoves = Set(0...8)

let winningConstellations = [ Set([0, 1, 2]),
                              Set([3, 4, 5]),
                              Set([6, 7, 8]),
                              Set([0, 3, 6]),
                              Set([1, 4, 7]),
                              Set([2, 5, 8]),
                              Set([0, 4, 8]),
                              Set([2, 4, 6]) ]

let transformations = [ [0, 1, 2, 3, 4, 5, 6, 7, 8],
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
