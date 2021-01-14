//
//  ScoreModifier.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/14/21.
//

import SwiftUI

struct ScoreModifier: ViewModifier {    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.purple)
            .opacity(0.7)
    }
}

extension View {
    func score() -> some View {
        self.modifier(ScoreModifier())
    }
}
