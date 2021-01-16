//
//  GameLogic.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import Foundation

extension Game {
    func newGame(players: Int, computerTurn: Bool = false, train: Bool = false) {
        if !fullyTrained() {
            Library.cache(to: self)
        }
        
        board = Game.newBoard()
        player = .X
        winner = nil
        moves = []
        possibleMoves = allMoves
        currentScores = Library.currentScores(in: self)
        self.train = train
        self.players = players
        self.computerTurn = computerTurn || (players == 0)
        
        if self.computerTurn {
            computerMove()
        }
    }
    
    static func newBoard() -> Board {
        Array(repeating: Player.none, count: 9)
    }

    static func nextPlayer(_ player: Player) -> Player {
        player == .X ? .O : .X
    }
    
    func fullyTrained() -> Bool {
        gamesTrained >= uniqueGames
    }

    static func findWinner(on board: Board) -> Player? {
        for player in [Player.X, Player.O] {
            let squaresWithPlayer = Set(board.indices.filter { board[$0] == player })
            
            for constellation in winningConstellations {
                if constellation.isSubset(of: squaresWithPlayer) {
                    return player
                }
            }
        }
        
        return nil
    }

    private func updateWinner() {
        if let winner = Game.findWinner(on: self.board) {
            self.winner = winner
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                Library.update(with: self)
            }
            return
        }
        
        if possibleMoves.isEmpty {
            winner = Player.none
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                Library.update(with: self)
            }
        }
    }

    private func play(_ move: Move) {
        board[move] = player
        moves.append(move)
        possibleMoves.remove(move)
        updateWinner()
        currentScores = Library.currentScores(in: self)
        player = Game.nextPlayer(self.player)
    }

    func computerMove() {
        let move = Library.bestMove(in: self, given: self.possibleMoves)
        
        play(move)
        
        if players != 0 {
            computerTurn = false
        } else if winner == nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.computerMove()
            }
        } else if train {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.newGame(players: 0, train: self.train)
            }
        }
    }

    func humanMove(row: Int, col: Int) {
        play(square(row, col))

        if players != 2 && winner == nil {
            computerTurn = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.computerMove()
            }
        }
    }
}
