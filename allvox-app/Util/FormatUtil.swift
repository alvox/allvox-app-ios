//
//  FormatUtil.swift
//  allvox-app
//
//  Created by alexander on 7/8/18.
//  Copyright © 2018 Alexander Popov. All rights reserved.
//

import Foundation

func formatDuration(seconds: Int64) -> String {
    let (h, m, s) = (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    return String(format: "%1.2d:%1.2d:%1.2d", h, m, s)
}

func formatDuration(seconds: TimeInterval) -> String {
    return formatDuration(seconds: Int64(seconds))
}
