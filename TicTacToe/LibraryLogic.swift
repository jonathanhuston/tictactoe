//
//  LibraryLogic.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/11/21.
//

import Foundation

func updateLibrary(with game: Game, winner: Player) {
    var node = game.library
    
    for move in game.moves {
        node.score += (winner == .X) ? 1 : -1
        if node.nextMoves[move] == nil {
            node.nextMoves[move] = Library()
        }
        node = node.nextMoves[move]!
    }
    
    game.trainingCounter += 1
}

func bestMove(in game: Game, given possibleMoves: [Move]) -> Move {
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
    
    if game.player == .X {
        return node.nextMoves.max { a, b in a.value.score < b.value.score }!.key
    } else {
        return node.nextMoves.min { a, b in a.value.score < b.value.score }!.key
    }
}
