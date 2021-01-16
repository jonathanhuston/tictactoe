//
//  LibraryLogic.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/17/21.
//

import Foundation

class LibraryLogic {
    
    private struct BoardState {
        var board = Game.newBoard()
        var player = Player.X
        var possibleMoves = allMoves
    }
    
    static func save(_ library: Library) {
        UserDefaults.standard.set(library.encode()!, forKey: "library")
    }
    
    static func reset() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
    
    static func cache(to game: Game) {
        game.libraryCache = Library.decode(libraryData: game.library)!
    }

    private static func maxScore(for moves: [Move: Library]) -> (key: Move, value: Library) {
        return moves.shuffled().max { a, b in a.value.score < b.value.score }!
    }

    private static func minScore(for moves: [Move: Library]) -> (key: Move, value: Library) {
        return moves.shuffled().min { a, b in a.value.score < b.value.score }!
    }

    private static func miniMaxScore(for moves: [Move: Library], given player: Player) -> Score {
        if player == .X {
            return maxScore(for: moves).value.score
        } else {
            return minScore(for: moves).value.score
        }
    }

    private static func score(given winner: Player?) -> Score {
        switch winner {
        case .X:
            return 1
        case .O:
            return -1
        default:
            return 0
        }
    }

    static func update(with game: Game) {
        if game.fullyTrained() {
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
            
            node.score = score(given: game.winner)
                            
            for node in nodes.reversed() {
                player = Game.nextPlayer(player)
                node.score = miniMaxScore(for: node.nextMoves, given: player)
            }
            
            if newTrainedGame {
                game.gamesTrained += 1
                newTrainedGame = false
            }
        }
        
        LibraryLogic.save(game.libraryCache)
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
        if game.train && !game.fullyTrained() {
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

    private static func play(_ move: Move, given boardState: BoardState) -> (winner: Player?, newBoardState: BoardState) {
        var newBoardState = boardState
        
        newBoardState.board[move] = boardState.player
        newBoardState.player = Game.nextPlayer(boardState.player)
        newBoardState.possibleMoves.remove(move)
        
        return (Game.findWinner(on: newBoardState.board), newBoardState)
    }

    private static func exploreMoves(at node: Library, given boardState: BoardState, gamesTrained: Int) -> Int {
        var counter = gamesTrained
        
        for move in boardState.possibleMoves {
            node.nextMoves[move] = Library()
            let (winner, newBoardState) = play(move, given: boardState)
            if winner != nil {
                node.nextMoves[move]!.score = score(given: winner)
                counter += 1
                continue
            }
            if newBoardState.possibleMoves.isEmpty {
                node.nextMoves[move]!.score = 0
                counter += 1
                continue
            }
            counter = exploreMoves(at: node.nextMoves[move]!, given: newBoardState, gamesTrained: counter)
        }

        node.score = miniMaxScore(for: node.nextMoves, given: boardState.player)
                
        return counter
    }

    static func populate(using game: Game) {
        game.populate = true
        game.players = 0
        game.libraryCache = Library()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            game.gamesTrained = exploreMoves(at: game.libraryCache, given: BoardState(), gamesTrained: 0)
            game.populate = false
            game.launch = true
//            LibraryLogic.save(game.libraryCache)
        }
    }
    
}

