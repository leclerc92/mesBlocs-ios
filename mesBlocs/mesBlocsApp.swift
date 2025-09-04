//
//  mesBlocsApp.swift
//  mesBlocs
//
//  Created by clement leclerc on 03/09/2025.
//

import SwiftUI
import SwiftData

@available(iOS 26.0, *)
@main
struct mesBlocsApp: App {
    
    // Configuration du container SwiftData
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            SessionModele.self,
            BlocModel.self
        ])
        
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false,
            cloudKitDatabase: .none // Changez en .automatic pour iCloud sync si souhaité
        )
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            AppView()
        }
        .modelContainer(sharedModelContainer)
    }
}
