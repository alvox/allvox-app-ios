//
//  Player.swift
//  allvox-app
//
//  Created by alexander on 7/5/18.
//  Copyright © 2018 Alexander Popov. All rights reserved.
//

import Foundation
import AVFoundation

class Player: NSObject, AVAudioPlayerDelegate {
    
    static let instance = Player()
    
    private var audioPlayer: AVAudioPlayer?
    private var isPlaying: Bool = false
    
    func play(filePath: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: filePath)
            audioPlayer?.play()
        } catch {
            debugPrint("Can't play file \(error)")
        }
    }
    
    func stop() {
        if let audioPlayer = audioPlayer {
            if audioPlayer.isPlaying {
                audioPlayer.stop()
            }
        }
        audioPlayer = nil
    }
    
}
