//
//  GameLogic.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import Foundation

func newBoard(size: Int) -> Board {
    let emptyRow = Array(repeating: Player.none, count: size)
    
    return Array(repeating: emptyRow, count: size)
}

func newGame(_ game: Game, players: Int, computerTurn: Bool = false, train: Bool = false) {
    game.board = newBoard(size: 3)
    game.player = .X
    game.winner = nil
    game.train = train
    game.moves = []
    game.players = players
    game.computerTurn = computerTurn || (players == 0)
    game.remaining = 9

    if let bundleID = Bundle.main.bundleIdentifier {
        UserDefaults.standard.removePersistentDomain(forName: bundleID)
    }

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

func allSamePlayer(in squares: [Player]) -> Player? {
    let firstSquare = squares[0]
    
    if firstSquare == .none {
        return nil
    }
    
    for square in squares {
        if square != firstSquare {
            return nil
        }
    }
    
    return firstSquare
}

func anyRowWinner(in board: Board) -> Player? {
    for row in board {
        if let winner = allSamePlayer(in: row) {
            return winner
        }
    }
    
    return nil
}

func anyColWinner(in board: Board) -> Player? {
    for i in 0..<board.count {
        var col = [Player]()
        
        for row in board {
            col.append(row[i])
        }
        
        if let winner = allSamePlayer(in: col) {
            return winner
        }
    }
    
    return nil
}

func anyDiagWinner(in board: Board) -> Player? {
    var diag1 = [Player]()
    var diag2 = [Player]()

    for i in 0..<board.count {
        diag1.append(board[i][i])
        diag2.append(board[i][board.count - i - 1])
    }
    
    if let winner = allSamePlayer(in: diag1) {
        return winner
    }
    
    if let winner = allSamePlayer(in: diag2) {
        return winner
    }
    
    return nil
}

func winner(_ game: Game) -> Player? {
    if let winner = anyRowWinner(in: game.board) {
        updateLibrary(with: game, winner: winner)
        return winner
    }
    
    if let winner = anyColWinner(in: game.board) {
        updateLibrary(with: game, winner: winner)
        return winner
    }
    
    if let winner = anyDiagWinner(in: game.board) {
        updateLibrary(with: game, winner: winner)
        return winner
    }
    
    if game.remaining == 0 {
        updateLibrary(with: game, winner: .none)
        return Player.none
    }
    
    return nil
}

func play(move: Move, in game: Game) {
    game.board[move.row][move.col] = game.player
    game.moves.append(move)
    game.remaining -= 1
    game.winner = winner(game)
    game.player = nextPlayer(player: game.player)
}

func computerMove(in game: Game) {
    var possibleMoves = [Move]()
    
    for row in 0..<game.board.count {
        for col in 0..<game.board.count {
            if game.board[row][col] == .none {
                possibleMoves.append(Move(row: row, col: col))
            }
        }
    }
    
    let move = bestMove(in: game, given: possibleMoves)
        
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

func humanMove(move: Move, in game: Game) {
    play(move: move, in: game)

    if game.players != 2 && game.winner == nil {
        game.computerTurn = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            computerMove(in: game)
        }
    }
}
