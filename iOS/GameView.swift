//
//  GameView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/10/21.
//

import SwiftUI

struct GameView {
    @EnvironmentObject var game: Game
    
    @State private var orientation = UIDevice.current.orientation
    
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .makeConnectable()
            .autoconnect()
}

extension GameView: View {
    var body: some View {
        Group {
            if orientation.isPortrait || Device.isPortrait() {
                VStack {
                    BoardView()
                    ControlsView()
                }
            } else {
                HStack {
                    BoardView()
                    ControlsView()
                }
            }
        }
        .onReceive(orientationChanged) { _ in
            self.orientation = UIDevice.current.orientation
        }
        .onAppear() {
            if game.launch && game.fullyTrained() {
                LibraryLogic.populate(using: game)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(Game())
    }
}
