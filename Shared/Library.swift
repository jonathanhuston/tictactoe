//
//  Library.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/11/21.
//

import Foundation

class Library: Codable {
    var score: Score? = nil
    var nextMoves = [Move: Library]()
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
}
