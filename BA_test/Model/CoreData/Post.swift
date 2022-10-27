//
//  Post.swift
//  BA_test
//
//  Created by Rokas Mikelionis on 2022-10-26.
//

import CoreData

extension Post {
    
    static func update(fetchedPost: FetchedPost, fetchedUser: FetchedUser, in context: NSManagedObjectContext) {
        let request = fetchRequest(NSPredicate(format: "id = %d", fetchedPost.id))
        let results = (try? context.fetch(request)) ?? []
        let post = results.first ?? Post(context: context)
        
        post.id = fetchedPost.id
        post.body = fetchedPost.body
        post.title = fetchedPost.title
        post.userId = fetchedPost.userId
        post.user = User.update(fetchedUser, in: context)
        post.objectWillChange.send()
                
        do {
            try context.save()
        } catch(let error) {
            print("couldn't update to CoreData: \(error.localizedDescription)")
        }
    }
    
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Post> {
        let request = NSFetchRequest<Post>(entityName: "Post")
        request.predicate = predicate
        return request
    }
    
}
