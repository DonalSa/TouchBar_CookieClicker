//
//  AppDelegate.swift
//  CookieClickerTouchbar
//
//  Created by Donal Salin on 25/12/2024.
//



import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    private var touchBarManager: TouchBarManager!
    var cookieModel: CookieModel!

    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
        touchBarManager = TouchBarManager(cookieModel: cookieModel)

        if let window = NSApplication.shared.windows.first {
            touchBarManager.setupTouchBar(for: window)
        }
    }
}
