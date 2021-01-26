//
//  Device.swift
//  Tic Tac Toe Aficionado
//
//  Created by Jonathan Huston on 1/12/21.
//

import SwiftUI

struct Device {
    static func height() -> CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    static func width() -> CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    static let scaling = min(width(), height()) / 625
    
    static func isPortrait() -> Bool {
        height() > width()
    }
    
    static let iOS = true
}
