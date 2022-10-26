//
//  ContentView.swift
//  BA_test
//
//  Created by Rokas Mikelionis on 2022-10-24.
//

import SwiftUI
import CoreData

struct MainView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Post.id, ascending: true)],
//        animation: .default)
//    var posts: FetchedResults<Post>
    
    @ObservedObject var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.posts) { post in
                VStack {
                    Text(post.title ?? "Untitled")
                    Text(post.user?.username ?? "Untitled")
                }
            }
        }
        .navigationTitle("Posts")
    }
}
