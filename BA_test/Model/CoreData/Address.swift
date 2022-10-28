//
//  Address.swift
//  BA_test
//
//  Created by Rokas Mikelionis on 2022-10-26.
//

import CoreData

extension Address {
    
    static func update(_ fetchedAddress: FetchedUser.Address, in context: NSManagedObjectContext) -> Address {
        let address = Address(context: context)

        address.city = fetchedAddress.city
        address.street = fetchedAddress.street
        address.zipcode = fetchedAddress.zipcode
        address.suite = fetchedAddress.suite
        address.geo = Geo.update(fetchedAddress.geo, in: context)
        address.objectWillChange.send()

        return address
    }
}

extension Geo {
    
    static func update(_ fetchedGeo: FetchedUser.Address.Location, in context: NSManagedObjectContext) -> Geo {
        let geo = Geo(context: context)
        
        geo.lat = fetchedGeo.lat
        geo.lng = fetchedGeo.lng
        geo.objectWillChange.send()

        return geo
    }
}
