//
//  BusinessCardApp.swift
//  BusinessCard
//
//  Created by Cristina Andolfatto on 25/04/24.
//

import SwiftUI

@main
struct BusinessCardApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
