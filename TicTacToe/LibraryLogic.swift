//
//  LibraryLogic.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/11/21.
//

import Foundation

func updateLibrary(with game: Game, winner: Player) {
    var node = game.library

    for (level, move) in game.moves.enumerated() {
        node.score += (winner == .X) ? (1 + level) : (-1 - level)
        
        if node.nextMoves[move] == nil {
            node.nextMoves[move] = Library()
        }
        node = node.nextMoves[move]!
    }
    
    game.trainingCounter += 1
}

func bestMove(in game: Game, given possibleMoves: [Move]) -> Move {
    let best: (key: Move, value: Library)
    var node = game.library
    
    for move in game.moves {
        if node.nextMoves[move] == nil {
            return possibleMoves.randomElement()!
        }
        node = node.nextMoves[move]!
    }
    
    if node.nextMoves.isEmpty {
        return possibleMoves.randomElement()!
    }
    
    // prevents local maxima when computer plays itself
    if game.players == 0 && Bool.random() {
        return possibleMoves.randomElement()!
    }
    
    if game.player == .X {
        best = node.nextMoves.max { a, b in a.value.score < b.value.score }!
        if best.value.score > 1 {
            return best.key
        }
    } else {
        best = node.nextMoves.min { a, b in a.value.score < b.value.score }!
        if best.value.score < 1 {
            return best.key
        }
    }
    
    return possibleMoves.randomElement()!
}
