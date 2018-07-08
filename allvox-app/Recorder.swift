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
    
    static let instance = Recorder()
    
    private var session: AVAudioSession!
    private var audioRecorder: AVAudioRecorder!
    private var recInfo: RecordingInfo?
    
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
        recInfo = RecordingInfo()
        do {
            audioRecorder = try AVAudioRecorder(url: (recInfo?.path)!, settings: audioFileSettings)
            audioRecorder.delegate = self
            audioRecorder.record()
        } catch {
            debugPrint(error)
            stopRecording(success: false)
        }
    }
    
    func stopRecording(success: Bool) {
        recInfo?.finalize(duration: audioRecorder.currentTime)
        audioRecorder.stop()
        isRecording = false
        audioRecorder = nil
        if success {
            saveRecording(from: recInfo!)
            print("Recording was successful")
        } else {
            print("Recording attempt failed!!!")
        }
        recInfo = nil
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
    
    func getTime() -> TimeInterval {
        if let audioRecorder = audioRecorder {
            return audioRecorder.currentTime
        }
        return 0
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            stopRecording(success: false)
        }
    }
    
}

struct RecordingInfo {
    
    var id: UUID
    var path: URL
    var date: Date?
    var name: String?
    var duration: Int?
    
    init() {
        self.id = UUID()
        self.path = newRecordingFilePath(from: id)
    }
    
    mutating func finalize(duration: TimeInterval) {
        self.date = Date()
        self.name = newRecordingName(from: date!)
        self.duration = Int(duration.rounded())
    }
    
}










