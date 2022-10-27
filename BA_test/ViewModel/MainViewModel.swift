//
//  MainViewModel.swift
//  BA_test
//
//  Created by Rokas Mikelionis on 2022-10-25.
//

import Foundation
import CoreData
import Combine

class MainViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    let network: NetworkService
    
    private let postsEndpoint = "https://jsonplaceholder.typicode.com/posts"
    private let userEndpoint = "https://jsonplaceholder.typicode.com/users/"
    
    private var cancellable: AnyCancellable?
    
    init(postsPublisher: AnyPublisher<[Post], Never> = PersistenceService.shared.posts.eraseToAnyPublisher(),
         network: NetworkService) {
        
        self.network = network
        
        cancellable = postsPublisher.sink { [unowned self] posts in
            self.posts = posts
        }
        
        getPosts()
        
    }
    
    func getPosts() {
        network.fetch(from: postsEndpoint) { [weak self] data, error in
            if let dataSource = data, let posts = try? JSONDecoder().decode([FetchedPost].self, from: dataSource) {
                for post in posts {
                    self?.getUser(userId: String(post.userId)) { [weak self] user in
                        Post.update(fetchedPost: post, fetchedUser: user, in: PersistenceController.shared.container.viewContext)
                        
                    }
                }
            }
        }
    }
    
    private func getUser(userId: String, completion: @escaping (FetchedUser) -> Void)  {
        network.fetch(from: userEndpoint + userId) { data, error in
            if let dataSource = data, let user = try? JSONDecoder().decode(FetchedUser.self, from: dataSource) {
                completion(user)
            }
            
        }
    }
    
}
