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

func saveRecording(from recInfo: RecordingInfo) {
    guard let ctx = appDelegate?.persistentContainer.viewContext else {return}
    let recording = Recording(context: ctx)
    recording.id = recInfo.id
    recording.name = recInfo.name
    recording.duration = Int64(recInfo.duration!)
    recording.path = recInfo.path
    recording.timestamp = recInfo.date
    do {
        try ctx.save()
        print("Successfully saved \(recInfo.name!)")
    } catch {
        debugPrint("Failed to save \(recInfo.name!)")
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

func deleteRecording(recording: Recording) {
    guard let ctx = appDelegate?.persistentContainer.viewContext else {return}
    ctx.delete(recording)
}

func deleteRecording(id: UUID) {
    guard let ctx = appDelegate?.persistentContainer.viewContext else {return}
    let request = NSFetchRequest<Recording>()
    request.predicate = NSPredicate.init(format: "id == \(id)")
    if let result = try? ctx.fetch(request) {
        for object in result {
            ctx.delete(object)
        }
    }
    do {
        try ctx.save()
    } catch {
        debugPrint("Error while deleting object, \(error)")
    }
}
