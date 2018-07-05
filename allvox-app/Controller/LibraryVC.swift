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
    
    var recordings: [Recording] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libraryTable.delegate = self
        libraryTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recordings = getAllRecordings()
        libraryTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension LibraryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recordingCell") as? RecordingCell
            else {return UITableViewCell()}
        let recording = recordings[indexPath.row]
        cell.configureCell(withRecording: recording)
        return cell
    }
    
}
