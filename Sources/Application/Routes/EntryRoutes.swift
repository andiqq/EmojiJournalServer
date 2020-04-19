//
//  EntryRoutes.swift
//  EmojiJournalServer
//
//  Created by Dr. Andreas Plagens on 18.04.20.
//

import Foundation
import LoggerAPI
import KituraContracts

private var dataStore = [String: JournalEntry]()

func initializeEntryRoutes(app: App) {
    app.router.get("/entries", handler: getAllEntries)
    app.router.post("/entries", handler: addEntry)
    app.router.delete("/entries", handler: deleteEntry)
    
    Log.info("Journal entry routes created")
}

func getAllEntries(completion: @escaping ([JournalEntry]?,
    RequestError?) -> Void) {
    let entries = dataStore.map { $0.value }
    completion(entries, nil)
}

func addEntry(entry: JournalEntry, completion: @escaping
    (JournalEntry?, RequestError?) -> Void) {
    var newEntry = entry
    newEntry.id = String(dataStore.count + 1)
    dataStore[newEntry.id!] = newEntry
    completion(newEntry, nil)
}

func deleteEntry(id: String, completion: @escaping
    (RequestError?) -> Void) {
    dataStore[id] = nil
    completion(nil)
}
