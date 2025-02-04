//
//  TouchBarManager.swift
//  CookieClickerTouchbar
//
//  Created by Donal Salin on 27/12/2024.
//

import Foundation
import AppKit

class TouchBarManager: NSObject, NSTouchBarDelegate, CookieModelDelegate {
    private var cookieModel: CookieModel
    private var countLabel: NSTextField!
    
     
    
    init(cookieModel: CookieModel) {
        self.cookieModel = cookieModel
        super.init()
        cookieModel.delegate = self // Set the delegate
    }

    func setupTouchBar(for window: NSWindow) {
        window.touchBar = makeTouchBar()
    }
 
    private func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        
        touchBar.defaultItemIdentifiers = [
                .cookieCounter,       // Counter label
                .flexibleSpace,       // Spacer to push the reset button to the right
                //.resetButton,          // Reset button
                .clickerButton
                
            ]
        
        return touchBar
    }
    
    // MARK: Application
    
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        switch identifier {
        case .cookieCounter:
            let item = NSCustomTouchBarItem(identifier: identifier)
            countLabel = NSTextField(labelWithString: "\(cookieModel.cookieCount())")
            countLabel.font = NSFont.systemFont(ofSize: 16) // Adjust font size
            item.view = countLabel
            return item

        case .resetButton:
            let item = NSCustomTouchBarItem(identifier: identifier)
            let button = NSButton(title: "Reset", target: self, action: #selector(resetCounter))
            button.font = NSFont.systemFont(ofSize: 16)
            item.view = button
            return item
            
        case .clickerButton:
            let item = NSCustomTouchBarItem(identifier: identifier)
            
            if let cookieImage = NSImage(named: "Minecraft Cookie") {
                
                let button = NSButton(image: cookieImage, target: self, action: #selector(clickButton))
                
                button.imagePosition = .imageOnly // Ensures only the image is displayed
                button.bezelStyle = .texturedRounded // Use a bezel style compatible with images
                
                button.frame = NSRect(x: 0, y: 0, width: 100, height: 100) // Set the desired frame size (adjust as needed)
                   
        
                item.view = button
            } else {
                print("Error: 'Minecraft Cookie' image not found.")
            }
            return item

        default:
            return nil
        }
    }

    @objc func resetCounter() {
        cookieModel.resetCount()
    }
    
    @objc func clickButton() {
        cookieModel.cookiePress()
    }

    // MARK: - CookieModelDelegate
    func didUpdateCookieCount(to newCount: Int) {
        countLabel.stringValue = "\(newCount)" // Update the Touch Bar label
    }
}

extension NSTouchBarItem.Identifier {
    static let cookieCounter = NSTouchBarItem.Identifier("com.example.cookieclicker.counter")
    static let resetButton = NSTouchBarItem.Identifier("com.example.cookieclicker.resetButton")
    static let clickerButton = NSTouchBarItem.Identifier("com.example.cookieclicker.clickerButton")
}
