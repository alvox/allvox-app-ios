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
    @IBOutlet weak var recBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
        Recorder.instance.prepare()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func recBtnPressed(_ sender: Any) {
        if Recorder.instance.isRecording {
            Recorder.instance.stopRecording(success: true)
            spinner.isHidden = true
            spinner.stopAnimating()
            recBtn.setTitle("REC", for: .normal)
        } else {
            Recorder.instance.startRecording()
            spinner.isHidden = false
            spinner.startAnimating()
            recBtn.setTitle("STOP", for: .normal)
        }
    }
    
}

