//
//  CoreDataStack.swift
//  JournalCoreData
//
//  Created by lijia xu on 7/26/21.
//

import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "JournalCoreData")
        container.loadPersistentStores { description, error in
            if let error = error {
               fatalError("unable to load CoreData PS \(error)")
            }
        }
        return container
    } ()
    
    static var context: NSManagedObjectContext { container.viewContext }
    
    static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving CoreData context \(error)")
            }
        }
    }
    
}//End Of CoreDataStack
