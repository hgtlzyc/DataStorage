//
//  EntryContoller.swift
//  JournalCoreData
//
//  Created by lijia xu on 7/26/21.
//

import CoreData

class EntryController {
    
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    // MARK: - CRUD Function
    func createEntry(title: String, body: String) {
        let entry = Entry(title: title, bodytext: body)
        entries.append(entry)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        do {
            entries = try CoreDataStack.context.fetch(fetchRequest)
        } catch {
            print("Error fetch from CoreData \(error)")
        }
        
    }
    
    func updateEntry(_ entry: Entry, title: String, body: String) {
        entry.title = title
        entry.bodyText = body
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(_ entry: Entry){
        CoreDataStack.context.delete(entry)
        CoreDataStack.saveContext()
        fetchEntries()
    }
    
    // MARK: - init
    private init(){}
    
    // MARK: - Helper
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
}
