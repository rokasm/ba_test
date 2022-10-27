//
//  Company.swift
//  BA_test
//
//  Created by Rokas Mikelionis on 2022-10-26.
//

import CoreData

extension Company {
    
    static func update(_ fetchedCompany: FetchedUser.Company, in context: NSManagedObjectContext) -> Company {
        let company = Company(context: context)
        
        company.name = fetchedCompany.name
        company.bs = fetchedCompany.bs
        company.catchPhrase = fetchedCompany.catchPhrase
        company.objectWillChange.send()
        
        return company
    }
}
