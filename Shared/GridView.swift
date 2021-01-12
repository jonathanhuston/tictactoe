//
//  GridView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct GridView {
    @EnvironmentObject var screenScaling: ScreenScaling
}

extension GridView: View {
    var body: some View {
        Image(systemName: "grid")
            .font(.system(size: 500 * screenScaling.factor, weight: .ultraLight))
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .environmentObject(ScreenScaling())
    }
}
