//
//  StatsView.swift
//  mesBlocs
//
//  Created by clement leclerc on 03/09/2025.
//

import SwiftUI
import _SwiftData_SwiftUI

struct StatsView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \SessionModele.date, order: .reverse)
    private var sessions: [SessionModele]
    
    var body: some View {
        NavigationView {
            Group {
                if sessions.isEmpty {
                    EmptyStateView()
                } else {
                    
                }
            }
            .navigationTitle("Création d'une session")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    StatsView()
}
