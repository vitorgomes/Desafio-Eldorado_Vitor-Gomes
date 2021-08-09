//
//  CoreDataManager.swift
//  ELDORADO_Desafio_iOS_Vitor_Gomes
//
//  Created by Vitor Gomes on 09/08/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func save() {
        
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
        
    }
    
    func getAllRepo() -> [Repo] {
        
        let request: NSFetchRequest<Repo> = Repo.fetchRequest()
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "ELDORADO_Desafio_iOS_Vitor_Gomes")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError(error.localizedDescription) //Treat better, dont leave fatal errors on production code
            } else {
                print("Coredata loaded")
            }
        }
    }
    
}
