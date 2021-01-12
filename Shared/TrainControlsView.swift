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
            Text("\(game.trainingCounter) \(game.trainingCounter == 1 ? "game" : "games") trained")
                .frame(width: 160)
                .font(.title3)
                .foregroundColor(.purple)
            
            Picker("", selection: $dummy) {
            }
            .pickerStyle(DefaultPickerStyle())
            .frame(width: 0)
            .hidden()
            
            Button(action: {
                game.train = false
            }) {
                Text("Suspend")
            }
            
            Button(action: {
                game.trainingCounter = 0
                game.library = newLibrary()
            }) {
                Text("Reset")
            }
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
