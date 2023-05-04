//
//  Yyussa_RentApp.swift
//  Yyussa Rent
//
//  Created by Claude KWIZERA on 5/4/23.
//

import SwiftUI

@main
struct Yyussa_RentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
