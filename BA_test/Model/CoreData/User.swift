//
//  User.swift
//  BA_test
//
//  Created by Rokas Mikelionis on 2022-10-26.
//

import CoreData

extension User {
    
    static func update(_ fetchedUser: FetchedUser, in context: NSManagedObjectContext) -> User {
        
        let user = User(context: context)
        
        user.id = fetchedUser.id
        user.username = fetchedUser.username
        user.email = fetchedUser.email
        user.name = fetchedUser.name
        user.username = fetchedUser.username
        user.address = Address.update(fetchedUser.address, in: context)
        user.objectWillChange.send()

        return user
    }
}
