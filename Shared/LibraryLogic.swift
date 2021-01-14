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
    
    static func new() -> Data {
        Library().encode()!
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

func maxScore(for moves: [Move: Library]) -> (key: Move, value: Library) {
    return moves.max { a, b in a.value.score < b.value.score }!
}

func minScore(for moves: [Move: Library]) -> (key: Move, value: Library) {
    return moves.min { a, b in a.value.score < b.value.score }!
}

func updateLibrary(with game: Game, winner: Player) {
    let library = Library.decode(libraryData: game.library)!
    var newTrainedGame = false
        
    for moves in symmetries(of: game.moves) {
        var node = library
        var nodes = [Library]()
        var player = Player.X

        for move in moves {
            nodes.append(node)
            player = nextPlayer(player: player)
            if node.nextMoves[move] == nil {
                newTrainedGame = true
                node.nextMoves[move] = Library()
            }
            node = node.nextMoves[move]!
        }
                
        switch winner {
        case .X:
            node.score = 1
        case .O:
            node.score = -1
        default:
            node.score = 0
        }
                        
        for node in nodes.reversed() {
            if player == .X {
                node.score = maxScore(for: node.nextMoves).value.score
            } else {
                node.score = minScore(for: node.nextMoves).value.score
            }
            player = nextPlayer(player: player)
        }
        
        if newTrainedGame {
            game.trainingCounter += 1
            newTrainedGame = false
        }
    }
    
    UserDefaults.standard.set(library.encode()!, forKey: "library")
}

func bestMove(in game: Game, given possibleMoves: Set<Move>) -> Move {
    var node = Library.decode(libraryData: game.library)!
    let best: (key: Move, value: Library)

    // if board configuration hasn't been explored yet, make random move
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
    
    if game.player == .X {
        best = maxScore(for: node.nextMoves)
        if best.value.score > -1 {
            return best.key
        }
    } else {
        best = minScore(for: node.nextMoves)
        if best.value.score < 1 {
            return best.key
        }
    }
    
    if possibleMoves.count > 1 {
        return (possibleMoves.filter { $0 != best.key }).randomElement()!
    } else {
        return possibleMoves.randomElement()!
    }
}
