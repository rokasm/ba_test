//
//  Network.swift
//  BA_test
//
//  Created by Rokas Mikelionis on 2022-10-24.
//

import Combine
import CoreData

class Network {
    
    private let postsEndpoint = "https://jsonplaceholder.typicode.com/posts"
    private let userEndpoint = "https://jsonplaceholder.typicode.com/users/"
    
    private var fetchPostsCancellable: AnyCancellable?
    private var fetchUserCancellable: AnyCancellable?

    
   func fetchPosts() {
       if let url = URL(string: postsEndpoint) {
           let request = URLRequest(url: url)
           fetchPostsCancellable = URLSession.shared.dataTaskPublisher(for: request)
               .map { $0.data }
               .decode(type: FetchedPost.self, decoder: JSONDecoder())
               .receive(on: DispatchQueue.main)
               .sink(receiveCompletion: { [weak self] completion in
                   switch completion {
                   case .finished:
                       break
                   case .failure:
                       break // show error message
                   }
               }, receiveValue: { [weak self] post in
                   print(post, post.userId)
                   self?.fetchUser(userId: post.userId)
               })
       }
        
    }
    
    private func fetchUser(userId: Int32) {
        if let url = URL(string: userEndpoint + String(userId)) {
            let request = URLRequest(url: url)
            fetchUserCancellable = URLSession.shared.dataTaskPublisher(for: request)
                .map { $0.data }
                .decode(type: FetchedUser.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure:
                        break // show error message
                    }
                }, receiveValue: { [weak self] user in
                    print(user)
                    User.update(user)
                })
        }
    }
    
}
