//
//  FileUtil.swift
//  allvox-app
//
//  Created by alexander on 6/14/18.
//  Copyright © 2018 Alexander Popov. All rights reserved.
//

import Foundation

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

func newRecordingFilePath(from uuid: UUID) -> URL {
    let id = uuid.uuidString
    return getDocumentsDirectory().appendingPathComponent("\(id).m4a")
}

func newRecordingName(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter.string(from: date)
}
