//
//  PopulateStatusView.swift
//  Tic Tac Toe Aficionado
//
//  Created by Jonathan Huston on 1/16/21.
//

import SwiftUI

struct PopulateStatusView: View {
    var body: some View {
        Text("Training all \(uniqueGames) games...")
            .font(Device.iOS ? .title2 : .title)
            .foregroundColor(.purple)
    }
}

struct PopulateStatusView_Previews: PreviewProvider {
    static var previews: some View {
        PopulateStatusView()
    }
}
