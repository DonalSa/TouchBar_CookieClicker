//
//  SoundLogic.swift
//  CookieClickerTouchbar
//
//  Created by Donal Salin on 27/12/2024.
//


import AVFoundation

var audioPlayer: AVAudioPlayer?
var isMuted = false

func playSound(sound: String, type: String){
    // Only play sound if not muted
    if isMuted { return }
    
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error: Couldn't find sound file")
        }
    }
}
