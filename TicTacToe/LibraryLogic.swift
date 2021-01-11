//
//  LibraryLogic.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/11/21.
//

import Foundation

func updateLibrary(with game: Game, winner: Piece) {
    game.trainingCounter += 1
    game.library.append((game.moves, winner))
}
