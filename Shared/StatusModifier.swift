//
//  StatusModifier.swift
//  Tic Tac Toe Aficionado
//
//  Created by Jonathan Huston on 1/19/21.
//

import SwiftUI

struct StatusModifier: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(Device.iOS ? .title2 : .title)
            .foregroundColor(color)
            .frame(width: 220)
    }
}

extension View {
    func statusModifier(color: Color) -> some View {
        self.modifier(StatusModifier(color: color))
    }
}
