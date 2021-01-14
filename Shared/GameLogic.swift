//
//  GameLogic.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import Foundation

extension Game {
    func newGame(players: Int, computerTurn: Bool = false, train: Bool = false) {
        Library.cache(to: self)
        
        self.board = Game.newBoard()
        self.player = .X
        self.winner = nil
        self.train = train
        self.moves = []
        self.players = players
        self.currentScores = Library.currentScores(in: self)
        self.computerTurn = computerTurn || (players == 0)
        self.possibleMoves = allMoves
        
        if self.computerTurn {
            self.computerMove()
        }
    }
    
    static func newBoard() -> Board {
        Array(repeating: Player.none, count: 9)
    }

    static func nextPlayer(_ player: Player) -> Player {
        player == .X ? .O : .X
    }

    func findWinnerOnBoard() -> Player? {
        for player in [Player.X, Player.O] {
            let squaresWithPlayer = Set(self.board.indices.filter { board[$0] == player })
            
            for constellation in winningConstellations {
                if constellation.isSubset(of: squaresWithPlayer) {
                    return player
                }
            }
        }
        
        return nil
    }

    func updateWinner() {
        if let winner = self.findWinnerOnBoard() {
            self.winner = winner
            Library.update(with: self)
            return
        }
        
        if self.possibleMoves.isEmpty {
            self.winner = Player.none
            Library.update(with: self)
        }
    }

    func play(move: Move) {
        self.board[move] = self.player
        self.moves.append(move)
        self.possibleMoves.remove(move)
        self.updateWinner()
        self.currentScores = Library.currentScores(in: self)
        self.player = Game.nextPlayer(self.player)
    }

    func computerMove() {
        let move = Library.bestMove(in: self, given: self.possibleMoves)
        
        play(move: move)
        
        if self.players != 0 {
            self.computerTurn = false
        } else if self.winner == nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.computerMove()
            }
        } else if self.train && self.trainingCounter < uniqueGames {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.newGame(players: 0, train: true)
            }
        }
    }

    func humanMove(row: Int, col: Int) {
        play(move: row * 3 + col)

        if self.players != 2 && self.winner == nil {
            self.computerTurn = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.computerMove()
            }
        }
    }
}
