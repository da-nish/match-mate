//
//  CoreData+Util.swift
//  MatchMateApp
//
//  Created by PropertyShare on 28/03/25.
//

import Foundation
import CoreData

class CoreDataUtil{
    var managedObjectContext: NSManagedObjectContext
    
    func getContext() -> NSManagedObjectContext{
        return managedObjectContext
    }
    
    init(){
        let persistentStore = PersistenceController.shared
        if ProcessInfo.isOnPreview(){
            self.managedObjectContext = PersistenceController.preview.container.viewContext
        }
        else{
            self.managedObjectContext = persistentStore.container.viewContext
        }

    }
}
