//
//  AppDelegate.swift
//  Tic Tac Toe Aficionado
//
//  Created by Jonathan Huston on 1/25/21.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet var window: NSWindow!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let nib = NSNib(nibNamed: NSNib.Name("MainMenu"), bundle: Bundle.main)
        nib?.instantiate(withOwner: NSApplication.shared, topLevelObjects: nil)
        NSWindow.allowsAutomaticWindowTabbing = false
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
