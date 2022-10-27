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
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
    
    struct Address: Codable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
        let geo: Location
        
        struct Location: Codable {
            let lat: String
            let lng: String
        }
    }
    
    struct Company: Codable {
        let name: String
        let catchPhrase: String
        let bs: String
    }
}
