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

func newRecordingFileName() -> URL {
    // todo: generate file name based on timestamp
    return getDocumentsDirectory().appendingPathComponent("test-recording.m4a")
}
