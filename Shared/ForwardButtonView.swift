//
//  ForwardButtonView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/19/21.
//

import SwiftUI

struct ForwardButtonView {
    @EnvironmentObject var game: Game
}

extension ForwardButtonView: View {
    var body: some View {
        Button(action: {
            game.redoMove()
        }) {
            Image(systemName: "arrow.forward")
                .frame(width: 50)
        }
    }
}

struct ForwardButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ForwardButtonView()
            .environmentObject(Game())
    }
}
