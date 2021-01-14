//
//  GameLogic.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import Foundation

extension Game {
    static func newBoard() -> Board {
        Array(repeating: Player.none, count: 9)
    }
}

func newGame(_ game: Game, players: Int, computerTurn: Bool = false, train: Bool = false) {
    game.board = Game.newBoard()
    game.player = .X
    game.winner = nil
    game.train = train
    game.moves = []
    game.players = players
    game.computerTurn = computerTurn || (players == 0)
    game.possibleMoves = Set(0...8)

//    if let bundleID = Bundle.main.bundleIdentifier {
//        UserDefaults.standard.removePersistentDomain(forName: bundleID)
//    }

    if game.computerTurn {
        computerMove(in: game)
    }
}

func nextPlayer(player: Player) -> Player {
    if player == .X {
        return .O
    } else {
        return .X
    }
}

func findWinner(on board: Board) -> Player? {
    for player in [Player.X, Player.O] {
        let playedSquares = Set(board.indices.filter { board[$0] == player })
        
        for constellation in winningConstellations {
            if constellation.isSubset(of: playedSquares) {
                return player
            }
        }
    }
    
    return nil
}

func winner(_ game: Game) -> Player? {
    if let winner = findWinner(on: game.board) {
        updateLibrary(with: game, winner: winner)
        return winner
    }
    
    if game.possibleMoves.isEmpty {
        updateLibrary(with: game, winner: .none)
        return Player.none
    }
    
    return nil
}

func play(move: Move, in game: Game) {
    game.board[move] = game.player
    game.moves.append(move)
    game.possibleMoves.remove(move)
    game.winner = winner(game)
    game.player = nextPlayer(player: game.player)
}

func computerMove(in game: Game) {
    let move = bestMove(in: game, given: game.possibleMoves)
        
    play(move: move, in: game)
    
    if game.players != 0 {
        game.computerTurn = false
    } else if game.winner == nil {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            computerMove(in: game)
        }
    } else if game.train {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            newGame(game, players: 0, train: true)
        }
    }
}

func humanMove(row: Int, col: Int, in game: Game) {
    play(move: row * 3 + col, in: game)

    if game.players != 2 && game.winner == nil {
        game.computerTurn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            computerMove(in: game)
        }
    }
}
