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
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
