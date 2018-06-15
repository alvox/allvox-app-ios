//
//  LibraryVC.swift
//  allvox-app
//
//  Created by alexander on 6/15/18.
//  Copyright © 2018 Alexander Popov. All rights reserved.
//

import UIKit

class LibraryVC: UIViewController {
    
    
    @IBOutlet weak var libraryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
