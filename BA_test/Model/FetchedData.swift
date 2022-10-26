//
//  FetchedData.swift
//  BA_test
//
//  Created by Rokas Mikelionis on 2022-10-25.
//

import Foundation

struct FetchedPost: Codable {
    let userId: Int32
    let id: Int32
    let title: String
    let body: String
}

struct FetchedUser: Codable {
    let id: Int32
    let name: String
    let username: String
    let address: Address
    let company: Company
    let email: String
    let phone: String
    let website: String
    
    struct Address: Codable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: Location
        let phone: String
        let website: String
        
        struct Location: Codable {
            let lat: String
            let lng: String
        }
    }
    
    struct Company: Codable {
        let name: String
        let catchphrase: String
        let bs: String
    }
}
