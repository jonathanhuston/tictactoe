//
//  ScoreModifier.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/14/21.
//

import SwiftUI

struct ScoreModifier: ViewModifier {
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size * Device.scaling))
            .foregroundColor(.purple)
            .opacity(0.8)
    }
}

extension View {
    func scoreModifier(size: CGFloat) -> some View {
        self.modifier(ScoreModifier(size: size))
    }
}
