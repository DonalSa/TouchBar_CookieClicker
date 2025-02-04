//
//  CookieClickerTouchbarApp.swift
//  CookieClickerTouchbar
//
//  Created by Donal Salin on 25/12/2024.
//
import SwiftUI

@main
struct CookieClickerTouchbarApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var sharedCookieModel = CookieModel() // Shared CookieModel instance
    
    var body: some Scene {
        WindowGroup {
            ContentView(CookieClick: sharedCookieModel)
                .onAppear {
                    appDelegate.cookieModel = sharedCookieModel // Share instance with AppDelegate
                }
        }
    }
}
