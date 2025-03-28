//
//  MatchMateAppApp.swift
//  MatchMateApp
//
//  Created by PropertyShare on 28/03/25.
//

import SwiftUI

@main
struct MatchMateAppApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MatchScreenView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
