//
//  CoredataManager.swift
//  MovieTrailersApp
//
//  Created by apple on 15.04.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MovieContainer")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    lazy var managedObjectContext: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()

    // MARK: - CRUD
    func saveContext () {
           let context = persistentContainer.viewContext
           if context.hasChanges {
               do {
                   try context.save()
               } catch {
                   let nserror = error as NSError
                   fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
               }
           }
    }

    func save<T: NSManagedObject>(_ object: T) {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving object: \(error.localizedDescription)")
        }
    }

    func delete<T: NSManagedObject>(_ object: T) {
        managedObjectContext.delete(object)
        saveContext()
    }
    func deleteAllEntities(entityName: String) {
         let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
         let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

         do {
             try managedObjectContext.execute(deleteRequest)
             print("All objects in \(entityName) entity have been deleted.")
         } catch {
             print("Error deleting objects in \(entityName) entity: \(error.localizedDescription)")
         }
     }
    // MARK: - Data Fetching

    func fetchData<T: NSManagedObject>(entityName: String, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil) -> [T] {
        let request = NSFetchRequest<T>(entityName: entityName)
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors

        do {
            let result = try managedObjectContext.fetch(request)
            return result
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
            return []
        }
    }


}

