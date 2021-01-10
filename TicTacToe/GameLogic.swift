//
//  GameLogic.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import Foundation

func newBoard(size: Int) -> Board {
    let emptyRow = Array(repeating: Piece.empty, count: size)
    
    return Array(repeating: emptyRow, count: size)
}

func newGame(_ game: Game, players: Int, humanStarts: Bool = true) {
    game.board = newBoard(size: 3)
    game.players = players
    game.humanStarts = humanStarts
    game.playing = Piece.X
    game.remaining = 9
    game.winner = nil
}

func nextPlayer(player: Piece) -> Piece {
    if player == Piece.X {
        return Piece.O
    } else {
        return Piece.X
    }
}

func allSamePlayer(in squares: [Piece]) -> Piece? {
    let firstSquare = squares[0]
    
    if firstSquare == Piece.empty {
        return nil
    }
    
    for square in squares {
        if square != firstSquare {
            return nil
        }
    }
    
    return firstSquare
}

func anyRowWinner(in board: Board) -> Piece? {
    for row in board {
        if let winner = allSamePlayer(in: row) {
            return winner
        }
    }
    
    return nil
}

func anyColWinner(in board: Board) -> Piece? {
    for i in 0..<board.count {
        var col = [Piece]()
        
        for row in board {
            col.append(row[i])
        }
        
        if let winner = allSamePlayer(in: col) {
            return winner
        }
    }
    
    return nil
}

func anyDiagWinner(in board: Board) -> Piece? {
    var diag1 = [Piece]()
    var diag2 = [Piece]()

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

func winner(_ game: Game) -> Piece? {
    if let winner = anyRowWinner(in: game.board) {
        return winner
    }
    
    if let winner = anyColWinner(in: game.board) {
        return winner
    }
    
    if let winner = anyDiagWinner(in: game.board) {
        return winner
    }
    
    if game.remaining == 0 {
        return Piece.empty
    }
    
    return nil
}
