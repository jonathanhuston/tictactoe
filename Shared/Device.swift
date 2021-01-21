//
//  Device.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/12/21.
//

import SwiftUI

struct Device {
    #if os(iOS)
    static func width() -> CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    static func height() -> CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    static var scaling: CGFloat = min(Device.width(), Device.height()) / 625
    
    static var iOS = true
    
    #elseif os(macOS)
    static func width() -> CGFloat {
        NSScreen.main!.frame.size.width
    }
    
    static func height() -> CGFloat {
        NSScreen.main!.frame.size.height
    }
    
    static var scaling: CGFloat = 1
    
    static var iOS = false
    #endif
            
    static func portrait() -> Bool {
        Device.height() > Device.width()
    }
}
