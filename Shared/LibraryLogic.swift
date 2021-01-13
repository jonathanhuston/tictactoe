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

func newLibrary() -> Data {
    Library().encode()!
}

func updateScore(of node: Library, with winner: Player) {
    if winner == .X {
        node.scoreX += 1
    } else if winner == .O {
        node.scoreO += 1
    }
}

func symmetries(of gameMoves: [Move]) -> [[Move]] {
    var symmetries: [[Move]] = [gameMoves]
    
    for transformation in transformations {
        var symmetricGame = [Move]()
        
        for move in gameMoves {
            symmetricGame.append(transformation[move])
        }
        
        symmetries.append(symmetricGame)
    }
    
    return symmetries
}

func updateLibrary(with game: Game, winner: Player) {
//    let library = Library.decode(libraryData: game.library)!
//    var node = library
    
    for moves in symmetries(of: game.moves) {
        var node = game.library
            
        for move in moves {
            if node.nextMoves[move] == nil {
                updateScore(of: node, with: winner)
                node.nextMoves[move] = Library()
            }
            node = node.nextMoves[move]!
        }
        
        updateScore(of: node, with: winner)
    }

//    UserDefaults.standard.set(library.encode()!, forKey: "library")
    game.trainingCounter += 1
}

func score(node: Library) -> Double {
    if node.scoreX == 0 && node.scoreO == 0 {
        return 1
    }
    
    if node.scoreO == 0 {
        return 1000
    }
    
    return Double(node.scoreX / node.scoreO)
}

func bestMove(in game: Game, given possibleMoves: Set<Move>) -> Move {
    let best: (key: Move, value: Library)
//    var node = Library.decode(libraryData: game.library)!
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
    
    // forces computer to explore new moves when playing itself
    if game.players == 0 {
        if possibleMoves.count > node.nextMoves.count {
            return (possibleMoves.subtracting(node.nextMoves.keys)).randomElement()!
        } else if Bool.random() {
            return possibleMoves.randomElement()!
        }
    }
    
//    for node in node.nextMoves {
//        print("Move: \(node.key)")
//        print("ScoreX: \(node.value.scoreX)")
//        print("ScoreO: \(node.value.scoreO)")
//    }
    
    if game.player == .X {
        best = node.nextMoves.max { a, b in score(node: a.value) < score(node: b.value) }!
//        print("Score: \(score(node: best.value))")
        if score(node: best.value) > 1 {
            return best.key
        }
    } else {
        best = node.nextMoves.min { a, b in score(node: a.value) < score(node: b.value) }!
//        print("Score: \(score(node: best.value))")
        if score(node: best.value) < 1 {
            return best.key
        }
    }
    
    if possibleMoves.count > 1 {
        return (possibleMoves.filter { $0 != best.key }).randomElement()!
    } else {
        return possibleMoves.randomElement()!
    }
}
