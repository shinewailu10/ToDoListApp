//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Shine Wai Lu on 12/6/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ToDoComponents.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ToDoMainView()
        }
        .modelContainer(sharedModelContainer)
    }
}

