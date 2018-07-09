//
//  RecorderVC.swift
//  allvox-app
//
//  Created by alexander on 6/13/18.
//  Copyright © 2018 Alexander Popov. All rights reserved.
//

import UIKit

class RecorderVC: UIViewController {
    
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setTime), userInfo: nil, repeats: true)
        Recorder.instance.prepare()
        startRecording()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func startRecording() {
        Recorder.instance.startRecording()
    }
    
    @IBAction func pauseBtnPressed(_ sender: Any) {
    }
    
    
    @IBAction func stopBtnPressed(_ sender: Any) {
        if !Recorder.instance.isRecording {
            return
        }
        Recorder.instance.stopRecording(success: true)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func setTime() {
        timerLbl.text = formatDuration(seconds: Recorder.instance.getTime())
    }
    
}

