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
            LibraryLogic.cache(to: self)
        }
        
        board = newBoard
        player = .X
        winner = nil
        moves = []
        movesTakenBack = []
        currentScores = LibraryLogic.currentScores(in: self)
        self.train = train
        self.players = players
        self.computerTurn = computerTurn || (players == 0)
        
        if self.computerTurn {
            computerMove()
        }
    }
    
    func possibleMoves() -> Set<Move> {
        allMoves.subtracting(moves)
    }
    
    func inProgress() -> Bool {
        !launch && winner == nil
    }
    
    func computerFirstMove() -> Bool {
        moves.count == 1 && players == 1 && player == .O
    }
    
    func fullyTrained() -> Bool {
        gamesTrained >= uniqueGames
    }
    
    func counterText() -> String {
        fullyTrained() ? "Training complete" : "\(gamesTrained) \(gamesTrained == 1 ? "game" : "games") trained"
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
                LibraryLogic.update(with: self)
            }
            return
        }
        
        if possibleMoves().isEmpty {
            winner = Player.none
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                LibraryLogic.update(with: self)
            }
        }
    }
    
    private func takeBackOneMove() {
        let move = moves.last!
        
        board[move] = .none
        moves.removeLast()
        movesTakenBack.append(move)
        player = nextPlayer(player)
    }
    
    func takeBackMove() {
        takeBackOneMove()
        
        if !moves.isEmpty && players == 1 {
            takeBackOneMove()
        }
        
        winner = nil
        currentScores = LibraryLogic.currentScores(in: self)
    }
    
    func redoOneMove() {
        if let move = movesTakenBack.popLast() {
            board[move] = player
            moves.append(move)
            player = nextPlayer(player)
        }
    }
    
    func redoMove() {
        redoOneMove()
        
        if !movesTakenBack.isEmpty && players == 1 {
            redoOneMove()
        }
        
        updateWinner()
        currentScores = LibraryLogic.currentScores(in: self)
    }

    private func play(_ move: Move) {
        board[move] = player
        moves.append(move)
        movesTakenBack = []
        updateWinner()
        currentScores = LibraryLogic.currentScores(in: self)
        player = nextPlayer(player)
    }

    func computerMove() {
        let move = LibraryLogic.bestMove(in: self)
        
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
