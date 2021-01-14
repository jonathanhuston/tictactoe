//
//  CounterView.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/15/21.
//

import SwiftUI

struct CounterView {
    @EnvironmentObject var screenScaling: ScreenScaling

    var text: String
}

extension CounterView: View {
    var body: some View {
        if screenScaling.factor >= 1 {
            Text(text)
                .frame(width: 200)
                .font(.title3)
                .foregroundColor(.purple)
        } else {
            Text(text)
                .fixedSize()
                .foregroundColor(.purple)
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(text: "counter")
            .environmentObject(ScreenScaling())
    }
}
