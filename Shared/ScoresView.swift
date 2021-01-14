//
//  ScoresView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/14/21.
//

import SwiftUI

struct ScoresView {
    @EnvironmentObject var game: Game
    
    @State var row = 0
    @State var col = 0
}

extension ScoresView: View {
    var body: some View {
        if game.showScores && game.players != 0 {
            if let score = Library.currentScores(in: game)[row * 3 + col] {
                Text("\(score)")
                    .font(.title)
                    .foregroundColor(.purple)
            }
        }
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
            .environmentObject(Game())
    }
}
