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
    
    var recording = false

    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func recBtnPressed(_ sender: Any) {
        if recording {
            recording = false
            spinner.isHidden = true
            spinner.stopAnimating()
            recBtn.setTitle("REC", for: .normal)
        } else {
            recording = true
            spinner.isHidden = false
            spinner.startAnimating()
            recBtn.setTitle("STOP", for: .normal)
        }
    }
    
}

