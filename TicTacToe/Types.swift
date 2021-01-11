//
//  Types.swift
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

typealias Board = [[Player]]

struct Move: Hashable, Codable {
    var row = 0
    var col = 0
}

class Library: Codable {
    var score: Int = 0
    var nextMoves = [Move: Library]()
}
