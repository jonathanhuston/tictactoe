//
//  ProgressDeviceView.swift
//  Tic Tac Toe Aficionado
//
//  Created by Jonathan Huston on 1/28/21.
//

import SwiftUI

struct ProgressDeviceView: View {
    var body: some View {
        if Device.iOS {
            ProgressView()
                .padding()
        } else {
            ProgressView()
                .progressViewStyle(LinearProgressViewStyle(tint: .purple))
                .padding()
        }
    }
}

struct ProgressDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressDeviceView()
    }
}
