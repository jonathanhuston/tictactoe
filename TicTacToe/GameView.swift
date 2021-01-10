//
//  GameView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct GameView {
    @EnvironmentObject var game: Game
}

extension GameView: View {
    var body: some View {
        VStack {
            ZStack {
                GridView()
                PiecesView()
            }
        
            StatusView()
            GameControlsView()
        }
        .frame(height: 650)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(Game())
    }
}
