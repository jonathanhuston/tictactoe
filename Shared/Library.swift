//
//  Library.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/11/21.
//

import Foundation

class Library: Codable {
    var score: Score = 0
    var nextMoves = [Move: Library]()
    
//        var count: Int {
//            1 + nextMoves.reduce(0) { $0 + $1.value.count }
//        }
}

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
    
    func save() {
        UserDefaults.standard.set(self.encode()!, forKey: "library")
    }
    
    static func reset() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
    
    static func cache(to game: Game) {
        game.libraryCache = decode(libraryData: game.library)!
    }

    static func maxScore(for moves: [Move: Library]) -> (key: Move, value: Library) {
        return moves.max { a, b in a.value.score < b.value.score }!
    }

    static func minScore(for moves: [Move: Library]) -> (key: Move, value: Library) {
        return moves.min { a, b in a.value.score < b.value.score }!
    }

    static func update(with game: Game) {
        if game.trainingCounter >= uniqueGames {
            return
        }
        
        var newTrainedGame = false
            
        for moves in symmetries(of: game.moves) {
            var node = game.libraryCache
            var nodes = [Library]()
            var player = Player.X

            for move in moves {
                nodes.append(node)
                if node.nextMoves[move] == nil {
                    newTrainedGame = true
                    node.nextMoves[move] = Library()
                }
                node = node.nextMoves[move]!
                player = Game.nextPlayer(player)
            }
                    
            switch game.winner {
            case .X:
                node.score = 1
            case .O:
                node.score = -1
            default:
                node.score = 0
            }
                            
            for node in nodes.reversed() {
                player = Game.nextPlayer(player)
                if player == .X {
                    node.score = maxScore(for: node.nextMoves).value.score
                } else {
                    node.score = minScore(for: node.nextMoves).value.score
                }
            }
            
            if newTrainedGame {
                game.trainingCounter += 1
                newTrainedGame = false
            }
        }
        
        game.libraryCache.save()
    }
    
    static func currentScores(in game: Game) -> [Score?] {
        var scores: [Score?] = Array(repeating: nil, count: 9)
        var node = game.libraryCache
                        
        for move in game.moves {
            if node.nextMoves[move] == nil {
                return scores
            }
            node = node.nextMoves[move]!
        }
                
        allMoves.forEach { scores[$0] = node.nextMoves[$0]?.score }
        
        return scores
    }

    static func bestMove(in game: Game, given possibleMoves: Set<Move>) -> Move {
        let best: (key: Move, value: Library)
        var node = game.libraryCache

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
        
        // forces computer to explore new moves when training
        if game.train {
            if possibleMoves.count > node.nextMoves.count {
                return (possibleMoves.subtracting(node.nextMoves.keys)).randomElement()!
            } else {
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
        
        // if best move sucks, play random move
        if possibleMoves.count > 1 {
            return (possibleMoves.filter { $0 != best.key }).randomElement()!
        } else {
            return possibleMoves.randomElement()!
        }
    }
    
    static func populate(using game: Game) {
        reset()
        cache(to: game)
        game.trainingCounter = 0
    }
}
