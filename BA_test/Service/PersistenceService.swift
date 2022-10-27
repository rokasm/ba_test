//
//  Persistance.swift
//  BA_test
//
//  Created by Rokas Mikelionis on 2022-10-27.
//

import CoreData
import Combine

class PersistenceService: NSObject, ObservableObject {
    var posts = CurrentValueSubject<[Post], Never>([])
    private let postFetchController: NSFetchedResultsController<Post>
    
    static let shared = PersistenceService()
    
    let request = NSFetchRequest<Post>(entityName: "Post")
    
    private override init() {
        request.sortDescriptors = [NSSortDescriptor(key: "id", ascending: true)]

        postFetchController = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: PersistenceController.shared.container.viewContext,
            sectionNameKeyPath: nil, cacheName: nil
        )
        
        
        super.init()
        
        postFetchController.delegate = self
        
        do {
            try postFetchController.performFetch()
            posts.value = postFetchController.fetchedObjects ?? []
        } catch {
            NSLog("Error: could not fetch objects")
        }
    }
}

extension PersistenceService: NSFetchedResultsControllerDelegate {
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let posts = controller.fetchedObjects as? [Post] else { return }
        self.posts.value = posts
    }
}

