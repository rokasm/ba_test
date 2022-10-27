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
