//
//  CoreDataStack.swift
//  Me See Hero
//
//  Created by Daniel Choi on 10/31/19.
//  Copyright © 2019 Daniel Choi. All rights reserved.
//

import Foundation
import CoreData
import UIKit

final class CoreDataStack: NSObject {
    
    static let shared = CoreDataStack()
    
    let modelName = "Me_See_Hero"
    
    lazy var context: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var sightings: [NSManagedObject] = []
    
    // MARK: - Core Data operations
    
    func update() {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Hero")
        do {
            sightings = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch requested item. \(error), \(error.userInfo)")
        }
    }
    
    func saveHero(name: String, image: Int16, zodiac: String, residence: String, location: String, snapshot: NSData) {
        
        if let entity = NSEntityDescription.entity(forEntityName: "Hero", in: context) {
            let hero = NSManagedObject(entity: entity, insertInto: context)
            hero.setValue(name, forKeyPath: "name")
            hero.setValue(image, forKeyPath: "image")
            hero.setValue(zodiac, forKeyPath: "zodiac")
            hero.setValue(residence, forKeyPath: "residence")
            hero.setValue(location, forKeyPath: "location")
            hero.setValue(snapshot, forKeyPath: "snapshot")
            
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save the hero sighting. \(error), \(error.userInfo)")
            }
        }
        update()
    }
    
    func deleteHero(hero: Hero) {
        if let _ = sightings.firstIndex(of: hero)  {
            context.delete(hero)
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not delete the hero sighting. \(error), \(error.userInfo)")
            }
        }
        update()
    }
    
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

}
