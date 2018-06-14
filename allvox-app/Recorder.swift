//
//  Recorder.swift
//  allvox-app
//
//  Created by alexander on 6/13/18.
//  Copyright © 2018 Alexander Popov. All rights reserved.
//

import Foundation
import AVFoundation

class Recorder: NSObject, AVAudioRecorderDelegate {
    
    private var session: AVAudioSession!
    private var audioRecorder: AVAudioRecorder!
    
    private(set) public var isRecording: Bool
    
    private let audioFileSettings = [
        AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
        AVSampleRateKey: 12000,
        AVNumberOfChannelsKey: 1,
        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
    ]
    
    override init() {
        self.isRecording = false
        super.init()
    }
    
    func startRecording() {
        isRecording = true
        print("Start recoding")
        let audioFileName = newRecordingFileName()
        do {
            audioRecorder = try AVAudioRecorder(url: audioFileName, settings: audioFileSettings)
            audioRecorder.delegate = self
            audioRecorder.record()
        } catch {
            debugPrint(error)
            stopRecording(success: false)
        }
    }
    
    func stopRecording(success: Bool) {
        isRecording = false
        audioRecorder.stop()
        audioRecorder = nil
        if success {
            print("Recording was successful")
        } else {
            print("Recording attempt failed!!!")
        }
    }
    
    func prepare() {
        session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.setActive(true)
            session.requestRecordPermission() { (allowed) in
                if allowed {
                    print("Recording permissions granted")
                }
            }
        } catch {
            debugPrint(error)
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            stopRecording(success: false)
        }
    }
    
}
