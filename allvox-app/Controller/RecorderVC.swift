//
//  RecorderVC.swift
//  allvox-app
//
//  Created by alexander on 6/13/18.
//  Copyright © 2018 Alexander Popov. All rights reserved.
//

import UIKit

class RecorderVC: UIViewController {
    
    var recBtn: UIButton!
    var spinner: UIActivityIndicatorView!
    let recorder = Recorder()
    
    let recBtnAttr: [NSAttributedStringKey: Any] = [
        .font: UIFont(name: "AvenirNext-Bold", size: 40)!,
        .foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7464011312, green: 0.8857318759, blue: 0.7402122021, alpha: 1)
        addRecBtn()
        addSpinner()
    }

    func addRecBtn() {
        let x = view.frame.width / 2 - 60
        let y = view.frame.height - 200
        recBtn = UIButton(frame: CGRect(x: x, y: y, width: 120, height: 80))
        recBtn.setAttributedTitle(NSAttributedString(string: "REC", attributes: recBtnAttr), for: .normal)
        recBtn.addTarget(self, action: #selector(recBtnPressed(_:)), for: .touchUpInside)
        view.addSubview(recBtn)
    }
    
    func addSpinner() {
        let x = view.frame.width / 2 - 50
        let y = view.frame.height / 2 - 50
        spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        spinner.frame = CGRect(x: x, y: y, width: 100, height: 100)
        spinner.isHidden = true
        view.addSubview(spinner)
    }
    
    @objc func recBtnPressed(_ sender: Any) {
        if recorder.isRecording {
            recorder.stopRecording()
            spinner.isHidden = true
            spinner.stopAnimating()
            recBtn.setAttributedTitle(NSAttributedString(string: "REC", attributes: recBtnAttr), for: .normal)
        } else {
            recorder.startRecording()
            spinner.isHidden = false
            spinner.startAnimating()
            recBtn.setAttributedTitle(NSAttributedString(string: "STOP", attributes: recBtnAttr), for: .normal)
        }
    }
    
}

