//
//  ContentView.swift
//  BA_test
//
//  Created by Rokas Mikelionis on 2022-10-24.
//

import SwiftUI
import CoreData

struct MainView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts) { post in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(post.title ?? "Untitled")
                        Text(post.user?.username ?? "Untitled").font(.subheadline).foregroundColor(.secondary)
                    }.padding(5)
                }
            } .navigationTitle("Posts")
                .refreshable {
                    viewModel.getPosts()
                }
                .alert("Couldn't load posts", isPresented: $viewModel.showingError) {
                    Button("Retry") { }
                }
        }
    }
}
