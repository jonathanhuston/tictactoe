//
//  ContentView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct ContentView {
    @EnvironmentObject var game: Game
}

extension ContentView: View {
    var body: some View {
        GameView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Game())
    }
}
