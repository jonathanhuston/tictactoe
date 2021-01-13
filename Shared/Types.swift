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

typealias Board = [Player]

typealias Move = Int

class Library: Codable {
    var scoreX = 0
    var scoreO = 0
    var nextMoves = [Move: Library]()
}
