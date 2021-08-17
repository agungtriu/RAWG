//
//  FavoriteProvider.swift
//  RAWG
//
//  Created by Agung Tri Utomo on 15/08/21.
//

import CoreData

class FavoriteProvider {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RAWG")
        container.loadPersistentStores { _, error in
            guard error == nil else {
                fatalError("Unresolved error \(error!)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = false
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.shouldDeleteInaccessibleFaults = true
        container.viewContext.undoManager = nil
        return container
    }()
    private func newTaskContext() -> NSManagedObjectContext {
        let taskContext = persistentContainer.newBackgroundContext()
        taskContext.undoManager = nil
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return taskContext
    }
    func getAllFavoriteGame(completion: @escaping(_ members: [FavoriteModel]) -> Void) {
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteGame")
            do {
                let results = try taskContext.fetch(fetchRequest)
                var favorites: [FavoriteModel] = []
                for result in results {
                    let favorite = FavoriteModel(
                        id: result.value(forKeyPath: "id") as? Int32,
                        name: result.value(forKeyPath: "name") as? String,
                        release: result.value(forKeyPath: "releaseDate") as? String,
                        backgroundImage: result.value(forKeyPath: "backgroundImage") as? String,
                        metacritic: result.value(forKeyPath: "metacritic") as? Int32,
                        description: result.value(forKeyPath: "about") as? String,
                        developers: result.value(forKeyPath: "developers") as? String,
                        publishers: result.value(forKeyPath: "publishers") as? String,
                        genres: result.value(forKeyPath: "genres") as? String,
                        website: result.value(forKeyPath: "website") as? String
                    )
                    favorites.append(favorite)
                }
                completion(favorites)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
    func getFavorite(_ id: Int, completion: @escaping(_ favorites: FavoriteModel) -> Void) {
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteGame")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id == \(id)")
            do {
                if let result = try taskContext.fetch(fetchRequest).first {
                    let favorite = FavoriteModel(
                        id: result.value(forKeyPath: "id") as? Int32,
                        name: result.value(forKeyPath: "name") as? String,
                        release: result.value(forKeyPath: "releaseDate") as? String,
                        backgroundImage: result.value(forKeyPath: "backgroundImage") as? String,
                        metacritic: result.value(forKeyPath: "metacritic") as? Int32,
                        description: result.value(forKeyPath: "about") as? String,
                        developers: result.value(forKeyPath: "developers") as? String,
                        publishers: result.value(forKeyPath: "publishers") as? String,
                        genres: result.value(forKeyPath: "genres") as? String,
                        website: result.value(forKeyPath: "website") as? String
                    )
                    completion(favorite)
                }
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
    func addFavorite(_ favoriteModel: FavoriteModel) throws {
        let taskContext = newTaskContext()
        taskContext.performAndWait {
            if let entity = NSEntityDescription.entity(forEntityName: "FavoriteGame", in: taskContext) {
                let favorite = NSManagedObject(entity: entity, insertInto: taskContext)
                favorite.setValue(favoriteModel.id, forKeyPath: "id")
                favorite.setValue(favoriteModel.name, forKeyPath: "name")
                favorite.setValue(favoriteModel.release, forKeyPath: "releaseDate")
                favorite.setValue(favoriteModel.backgroundImage, forKeyPath: "backgroundImage")
                favorite.setValue(favoriteModel.metacritic, forKeyPath: "metacritic")
                favorite.setValue(favoriteModel.description, forKeyPath: "about")
                favorite.setValue(favoriteModel.developers, forKeyPath: "developers")
                favorite.setValue(favoriteModel.publishers, forKeyPath: "publishers")
                favorite.setValue(favoriteModel.genres, forKeyPath: "genres")
                favorite.setValue(favoriteModel.website, forKeyPath: "website")
                do {
                    try taskContext.save()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
        }
    }
    func deleteFavorite(_ id: Int) throws {
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteGame")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id == \(id)")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            batchDeleteRequest.resultType = .resultTypeCount
            do {
                try taskContext.execute(batchDeleteRequest)
            } catch let error as NSError {
                print("Could not delete. \(error), \(error.userInfo)")
            }
        }
    }
}
