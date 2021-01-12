//
//  TrainControlsView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/11/21.
//

import SwiftUI

struct TrainControlsView {
    @EnvironmentObject var game: Game
    
    @State private var dummy = ""
}

extension TrainControlsView: View {
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                game.train = false
            }) {
                Text("Suspend")
            }
            
            Text("\(game.trainingCounter) \(game.trainingCounter == 1 ? "game" : "games") trained")
                .frame(width: 200)
                .foregroundColor(.purple)
            
            Button(action: {
                game.trainingCounter = 0
                game.library = newLibrary()
            }) {
                Text("Reset")
            }
            
            Picker("", selection: $dummy) {
            }
            .pickerStyle(DefaultPickerStyle())
            .frame(width: 0)
            .hidden()
        }
        .padding()
    }
}

struct TrainControlsView_Previews: PreviewProvider {
    static var previews: some View {
        TrainControlsView()
            .environmentObject(Game())
    }
}
