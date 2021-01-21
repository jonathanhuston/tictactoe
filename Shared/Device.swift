//
//  Device.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/12/21.
//

import SwiftUI

struct Device {
    #if os(iOS)
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
    
    #elseif os(macOS)
    static let scaling: CGFloat = 1
    
    static let iOS = false
    #endif
}
