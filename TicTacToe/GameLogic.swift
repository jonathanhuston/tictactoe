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

func newGame(_ game: Game, players: Int, computerTurn: Bool = false) {
    game.board = newBoard(size: 3)
    game.players = players
    game.playing = Piece.X
    game.computerTurn = computerTurn || (players == 0)
    game.computerMove = (computerTurn ? computerMove(in: game) : (0, 0))
    game.remaining = (computerTurn ? 8 : 9)
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

func playPiece(in game: Game, row: Int, col: Int) {
    game.board[row][col] = game.playing
    game.remaining -= 1
    game.winner = winner(game)
    game.playing = nextPlayer(player: game.playing)
}

func computerMove(in game: Game) -> (Int, Int) {
    var emptySquares = [(Int, Int)]()
    
    for row in 0..<game.board.count {
        for col in 0..<game.board.count {
            if game.board[row][col] == Piece.empty {
                emptySquares.append((row, col))
            }
        }
    }
    
    let (row, col) = emptySquares.randomElement()!
    
    playPiece(in: game, row: row, col: col)
    
    if game.players != 0 {
        game.computerTurn = false
    } else if game.winner == nil {
        game.computerMove = computerMove(in: game)
    }
    
    return (row, col)
}

func humanMove(in game: Game, row: Int, col: Int) {
    playPiece(in: game, row: row, col: col)
    
    if game.players != 2 && game.winner == nil {
        game.computerTurn = true
        game.computerMove = computerMove(in: game)
    }
}
