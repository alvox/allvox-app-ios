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
        setupRecBtn()
        // Do any additional setup after loading the view.
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
        recBtn.frame.size.width = 50
        recBtn.frame.size.height = 50
        
        let x = (self.view.frame.width / 2) - 25
        let y = self.tabBar.frame.origin.y - 25
        
        recBtn.frame.origin = CGPoint(x: x, y: y)
        
        self.view.addSubview(recBtn)
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
