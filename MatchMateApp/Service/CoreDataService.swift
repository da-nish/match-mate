//
//  CoreDataService.swift
//  MatchMateApp
//
//  Created by Danish khan on 28/03/25.
//

import Foundation
import SwiftUI
import CoreData

typealias CDMatchMate = MMatch

class CoreDataService{
    
    init(viewContext: NSManagedObjectContext) {
        self.viewContext = viewContext
    }
    
    let viewContext: NSManagedObjectContext
    
    func getAllRecords() -> [CDMatchMate]{
        
            let request: NSFetchRequest<CDMatchMate> = CDMatchMate.fetchRequest()
            do {
               let items = try viewContext.fetch(request)
                return items
            } catch {
                print("Failed to fetch items: \(error)")
            }
        return []
        
    }
    
    func saveList(list: [MateModel]) {
        
        for item in list {
            let cdMatchMate = CDMatchMate(context: viewContext)
            cdMatchMate.uuid = UUID().uuidString
            cdMatchMate.name = item.name.first ?? ""
            cdMatchMate.age = Int16(item.dob.age)
            cdMatchMate.gender = Gender.getValue(value: item.gender)
            cdMatchMate.image = item.picture.medium
            cdMatchMate.matchStatus = ""
            cdMatchMate.street = item.location?.street?.name ?? "-"
        }

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    func deleteRecord(item: NSManagedObject) {
        
        viewContext.delete(item)
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func updateItem(item: MatchMateModel, status: String) {
        
        let fetchRequest: NSFetchRequest<CDMatchMate> = CDMatchMate.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uuid == %@", item.uuid)
        
        do {
            if let itemToUpdate = try viewContext.fetch(fetchRequest).first {
                // Update the attributes
                itemToUpdate.matchStatus = status
            }
            else {
                print("Item with UUID not found.")
            }
            
            try viewContext.save()
            
        } catch {
            print("Failed to update item: \(error.localizedDescription)")
        }
    }
    
    
}
