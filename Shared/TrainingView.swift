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
        if Device.iPhone {
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
                Button("Suspend") {
                    game.train = false
                }
                
                CounterTextView()
                
                Button("Reset") {
                    LibraryLogic.reset(game)
                    game.train = false
                }
                
                DummyPicker()
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
