//
//  TriggeredApp.swift
//  Triggered
//
//  Created by Brittany Rima on 3/6/22.
//

import SwiftUI

@main
struct SafePeopleApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var userSettings = UserSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(userSettings)
        }
    }
}