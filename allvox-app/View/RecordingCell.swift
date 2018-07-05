//
//  RecordingCell.swift
//  allvox-app
//
//  Created by alexander on 7/4/18.
//  Copyright © 2018 Alexander Popov. All rights reserved.
//

import UIKit

class RecordingCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    
    private var filePath: URL!
    
    func configureCell(withRecording recording: Recording) {
        self.nameLbl.text = recording.name
        self.durationLbl.text = formatDuration(seconds: recording.duration)
        self.dateLbl.text = formatDate(date: recording.timestamp)
        self.filePath = recording.path
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func formatDuration(seconds: Int64) -> String {
        let (h, m, s) = (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
        return String(format: "%1.2d:%1.2d:%1.2d", h, m, s)
    }
    
    private func formatDate(date: Date?) -> String {
        if let date = date {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(for: date)!
        }
        return ""
    }

}
