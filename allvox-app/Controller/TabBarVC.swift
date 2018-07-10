//
//  TabBarVC.swift
//  allvox-app
//
//  Created by alexander on 7/8/18.
//  Copyright © 2018 Alexander Popov. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    @IBOutlet var recBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlayer()
        setupRecBtn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recBtnPressed(_ sender: Any) {
        print("REC button pressed!")
        let recorderVC = storyboard?.instantiateViewController(withIdentifier: "recorderVC")
        present(recorderVC!, animated: true, completion: nil)
    }
    
    private func setupRecBtn() {
        recBtn.frame.size.width = 70
        recBtn.frame.size.height = 70
        
        let x = (self.view.frame.width / 2) - 35
        let y = self.tabBar.frame.origin.y - 35
        
        recBtn.frame.origin = CGPoint(x: x, y: y)
        
        self.view.addSubview(recBtn)
    }
    
    private func setupPlayer() {
        let width = self.view.frame.width
        let height = CGFloat(70)
        let x = CGFloat(0)
        let y = self.tabBar.frame.origin.y - 70
        let playerView = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        playerView.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        playerView.isHidden = false
        self.view.addSubview(playerView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
