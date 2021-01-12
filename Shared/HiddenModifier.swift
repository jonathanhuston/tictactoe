//
//  HiddenModifier.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct HiddenModifier: ViewModifier {
    var condition: Bool
    
    func body(content: Content) -> some View {
        content
            .disabled(condition)
            .opacity(condition ? 0 : 1)
    }
}

extension View {
    func hidden(_ condition: Bool = true) -> some View {
        self.modifier(HiddenModifier(condition: condition))
    }
}
