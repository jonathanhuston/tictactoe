//
//  Device.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/12/21.
//

import SwiftUI

struct Device {
    #if os(iOS)
    static var scaling = min(UIScreen.main.bounds.size.width,
                             UIScreen.main.bounds.size.height) / 625
    
    static var iOS = true
    
    #elseif os(macOS)
    static var scaling: CGFloat = 1
    
    static var iOS = false
    #endif
}
