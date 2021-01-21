//
//  TrainingView.swift
//  TicTacToe
//
//  Created by Jonathan Huston on 1/11/21.
//5

import SwiftUI

struct TrainingView {
    @EnvironmentObject var game: Game
}

extension TrainingView: View {
    var body: some View {
        if Device.iOS {
            VStack {
                CounterTextView()

                HStack(spacing: 40) {
                    Button("Suspend") {
                        game.train = false
                    }
                    
                    Button("Reset") {
                        LibraryLogic.reset(game)
                        game.train = false
                    }
                }
            }
        } else {
            HStack {
                Button(action: {
                    game.train = false
                }) {
                    Text("Suspend")
                        .frame(width: 60)
                }
                
                CounterTextView()
                
                Button(action: {
                    LibraryLogic.reset(game)
                    game.train = false
                }) {
                    Text("Reset")
                        .frame(width: 60)
                }
            }
            .padding()
        }
    }
}

struct TrainControlsView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingView()
            .environmentObject(Game())
    }
}
