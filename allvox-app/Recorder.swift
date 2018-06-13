//
//  Recorder.swift
//  allvox-app
//
//  Created by alexander on 6/13/18.
//  Copyright © 2018 Alexander Popov. All rights reserved.
//

import Foundation

class Recorder {
    
    private(set) public var isRecording: Bool
    
    init() {
        self.isRecording = false
    }
    
    func startRecording() {
        isRecording = true
        print("Start recoding")
    }
    
    func stopRecording() {
        isRecording = false
        print("Stop recording")
    }
    
}
