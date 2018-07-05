//
//  Datalayer.swift
//  allvox-app
//
//  Created by alexander on 7/4/18.
//  Copyright © 2018 Alexander Popov. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

func saveRecording(forFile path: URL, completion: (_ finished: Bool) -> ()) {
    guard let ctx = appDelegate?.persistentContainer.viewContext else {return}
    let recording = Recording(context: ctx)
    recording.id = UUID()
    recording.name = "" // todo
    recording.duration = 1 // todo
    recording.path = path
    recording.timestamp = nil // todo
    do {
        try ctx.save()
        print("Successfully saved \(path.absoluteString)")
        completion(true)
    } catch {
        debugPrint("Failed to save \(path.absoluteString)")
        completion(false)
    }
    
}

func getAllRecordings() -> [Recording] {
    guard let ctx = appDelegate?.persistentContainer.viewContext else {return []}
    let request = NSFetchRequest<Recording>(entityName: "Recording")
    do {
        return try ctx.fetch(request)
    } catch {
        debugPrint("Failed to get recordings from the db: \(error)")
        return []
    }
}
