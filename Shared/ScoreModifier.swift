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
            .font(Device.iPhone ? .title2 : .title)
            .foregroundColor(.purple)
            .opacity(0.8)
    }
}

extension View {
    func scoreModifier() -> some View {
        self.modifier(ScoreModifier())
    }
}
