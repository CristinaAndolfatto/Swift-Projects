//
//  I_Am_RichApp.swift
//  I Am Rich
//
//  Created by Cristina Andolfatto on 23/04/24.
//

import SwiftUI

@main
struct I_Am_RichApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
