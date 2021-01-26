//
//  CounterTextView.swift
//  Tic Tac Toe Aficionado
//
//  Created by Jonathan Huston on 1/15/21.
//

import SwiftUI

struct CounterTextView {
    @EnvironmentObject var game: Game
}

extension CounterTextView: View {
    var body: some View {
        if Device.iOS {
            Text(game.counterText())
                .fixedSize()
                .font(.title2)
                .foregroundColor(.purple)
                .padding()
        } else {
            Text(game.counterText())
                .frame(width: 200)
                .font(.title3)
                .foregroundColor(.purple)
        }
    }
}

struct CounterTextView_Previews: PreviewProvider {
    static var previews: some View {
        CounterTextView()
            .environmentObject(Game())
    }
}
