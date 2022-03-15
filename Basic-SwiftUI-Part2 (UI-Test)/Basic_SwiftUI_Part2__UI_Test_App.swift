//
//  Basic_SwiftUI_Part2__UI_Test_App.swift
//  Basic-SwiftUI-Part2 (UI-Test)
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI

@main
struct Basic_SwiftUI_Part2__UI_Test_App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SwiftCalView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
