//
//  LibraryLogic.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/11/21.
//

import Foundation

extension Library {
    func encode() -> Data? {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            return encoded
        } else {
            return nil
        }
    }
    
    static func decode(libraryData: Data) -> Library? {
        let decoder = JSONDecoder()
        if let library = try? decoder.decode(Library.self, from: libraryData) {
            return library
        } else {
            return nil
        }
    }
 }

func updateLibrary(with game: Game, winner: Player) {
    let library = Library.decode(libraryData: game.library)!
    var node = library
    
    for (level, move) in game.moves.enumerated() {
        node.score += (winner == .X) ? (1 + level) : (-1 - level)

        if node.nextMoves[move] == nil {
            node.nextMoves[move] = Library()
        }
        node = node.nextMoves[move]!
    }
    
    UserDefaults.standard.set(library.encode()!, forKey: "library")
    game.trainingCounter += 1
}

func bestMove(in game: Game, given possibleMoves: [Move]) -> Move {
    let best: (key: Move, value: Library)
    var node = Library.decode(libraryData: game.library)!

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
