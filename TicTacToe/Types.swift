//
//  Types.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import Foundation

enum Piece {
    case X
    case O
    case empty
}

typealias Board = [[Piece]]
typealias Move = (Board, Piece, row: Int, col: Int)
typealias Library = [(moves: [Move], winner: Piece)]
