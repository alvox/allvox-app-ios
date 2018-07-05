//
//  RecordingCell.swift
//  allvox-app
//
//  Created by alexander on 7/4/18.
//  Copyright © 2018 Alexander Popov. All rights reserved.
//

import UIKit

class RecordingCell: UITableViewCell {
    
    
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var urlLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    func configureCell(withRecording recording: Recording) {
        self.idLbl.text = recording.id?.uuidString
        self.nameLbl.text = recording.name
        self.urlLbl.text = recording.path?.absoluteString
        self.durationLbl.text = String(describing: recording.duration)
        self.dateLbl.text = recording.timestamp?.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
