//
//  BA_testApp.swift
//  BA_test
//
//  Created by Rokas Mikelionis on 2022-10-24.
//

import SwiftUI

@main
struct BA_testApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel(network: Network())
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
            )
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
