//
//  ScoreModifier.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/14/21.
//

import SwiftUI

struct ScoreModifier: ViewModifier {
    var reduce: Bool
    
    func body(content: Content) -> some View {
        content
            .font(reduce ? .title2 : .title)
            .foregroundColor(.purple)
            .opacity(0.7)
    }
}

extension View {
    func scoreModifier(reduce: Bool = false) -> some View {
        self.modifier(ScoreModifier(reduce: reduce))
    }
}
