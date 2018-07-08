//
//  RecorderVC.swift
//  allvox-app
//
//  Created by alexander on 6/13/18.
//  Copyright © 2018 Alexander Popov. All rights reserved.
//

import UIKit

class RecorderVC: UIViewController {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var recBtn: UIButton!
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setTime), userInfo: nil, repeats: true)
        spinner.isHidden = true
        Recorder.instance.prepare()
        startRecording()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func startRecording() {
        Recorder.instance.startRecording()
        spinner.isHidden = false
        spinner.startAnimating()
        recBtn.setTitle("STOP", for: .normal)
    }

    @IBAction func recBtnPressed(_ sender: Any) {
        if Recorder.instance.isRecording {
            Recorder.instance.stopRecording(success: true)
            spinner.isHidden = true
            spinner.stopAnimating()
            recBtn.setTitle("REC", for: .normal)
            dismiss(animated: true, completion: nil)
        } else {
            Recorder.instance.startRecording()
            spinner.isHidden = false
            spinner.startAnimating()
            recBtn.setTitle("STOP", for: .normal)
        }
    }
    
    @objc func setTime() {
        timerLbl.text = formatDuration(seconds: Recorder.instance.getTime())
    }
    
}

