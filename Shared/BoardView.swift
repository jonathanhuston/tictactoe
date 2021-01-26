//
//  BoardView.swift
//  Tic Tac Toe Aficionado
//
//  Created by Jonathan Huston on 1/21/21.
//

import SwiftUI

struct BoardView {
    @EnvironmentObject var game: Game
}

extension BoardView: View {
    var body: some View {
        VStack {
            ZStack {
                GridView()
                
                if !game.launch && !game.populate {
                    PiecesView()
                }
            }
        
            StatusView()
                .hidden(game.launch)
        }
        .frame(width: 550 * Device.scaling, height: 550 * Device.scaling)
        .onAppear() {
            if game.launch && game.fullyTrained() {
                LibraryLogic.populate(using: game)
            }
        }
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
            .environmentObject(Game())
    }
}
