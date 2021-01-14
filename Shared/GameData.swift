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

class Library: Codable {
    var score = 0
    var nextMoves = [Move: Library]()
    
//    var count: Int {
//        1 + nextMoves.reduce(0) { $0 + $1.value.count }
//    }
}

let winningConstellations = [ Set([0, 1, 2]),
                              Set([3, 4, 5]),
                              Set([6, 7, 8]),
                              Set([0, 3, 6]),
                              Set([1, 4, 7]),
                              Set([2, 5, 8]),
                              Set([0, 4, 8]),
                              Set([2, 4, 6]) ]

let transformations = [ [2, 1, 0, 5, 4, 3, 8, 7, 6],
                        [6, 7, 8, 3, 4, 5, 0, 1, 2],
                        [6, 3, 0, 7, 4, 1, 8, 5, 2],
                        [2, 5, 8, 1, 4, 7, 0, 3, 6],
                        [8, 7, 6, 5, 4, 3, 2, 1, 0],
                        [0, 3, 6, 1, 4, 7, 2, 5, 8],
                        [8, 5, 2, 7, 4, 1, 6, 3, 0] ]
                        
