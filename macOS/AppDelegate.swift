//
//  AppDelegate.swift
//  Tic Tac Toe
//
//  Created by Jonathan Huston on 1/25/21.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet var window: NSWindow!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let nib = NSNib(nibNamed: NSNib.Name("MainMenu"), bundle: Bundle.main)
        nib?.instantiate(withOwner: NSApplication.shared, topLevelObjects: nil)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
    }
}
