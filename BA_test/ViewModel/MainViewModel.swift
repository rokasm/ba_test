//
//  MainViewModel.swift
//  BA_test
//
//  Created by Rokas Mikelionis on 2022-10-25.
//

import Foundation
import CoreData

class MainViewModel: ObservableObject {
    
    let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    // Redundant in case of this app, but added to show the aproach of separate network service
    func getPosts() {
        network.fetchPosts()
    }
    
}
