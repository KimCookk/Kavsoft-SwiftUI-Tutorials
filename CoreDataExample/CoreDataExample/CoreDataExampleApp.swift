//
//  CoreDataExampleApp.swift
//  CoreDataExample
//
//  Created by 김태성 on 4/25/24.
//

import SwiftUI

@main
struct CoreDataExampleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
