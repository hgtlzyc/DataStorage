//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by lijia xu on 7/26/21.
//

import CoreData

extension Entry {
    @discardableResult
    convenience init(title: String, bodytext: String, timeStamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context ) {
        self.init(context: context)
        self.title = title
        self.timeStamp = timeStamp
        self.bodyText = bodytext
    }
}
