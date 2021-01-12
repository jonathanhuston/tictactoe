//
//  Device.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/12/21.
//

import SwiftUI

class Device {
    #if os(iOS)
    static var width:CGFloat = UIScreen.main.bounds.size.width
    #elseif os(macOS)
    static var width:CGFloat = NSScreen.main!.frame.size.width
    #endif
}
