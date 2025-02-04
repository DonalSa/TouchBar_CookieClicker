//
//  CookieLogic.swift
//  CookieClickerTouchbar
//
//  Created by Donal Salin on 25/12/2024.
//

import Foundation

protocol CookieModelDelegate: AnyObject {
    func didUpdateCookieCount(to newCount: Int)
}

class CookieModel: ObservableObject {
    
    @Published var counter: Int = 0
    weak var delegate: CookieModelDelegate?
    
    func cookiePress() {
        counter += 1
        playSound(sound: "mc_eat3", type: "mp3")
        print("Button pressed. Counter is now \(counter)") // Debug log
        delegate?.didUpdateCookieCount(to: counter) // Notify delegate
    }
    
    func cookieCount() -> Int {
        return counter
    }
    
    func resetCount() {
        counter = 0
        playSound(sound: "mc_burp", type: "mp3")
        print("Counter reset to \(counter)") // Debug log
        delegate?.didUpdateCookieCount(to: counter) // Notify delegate
    }
}
