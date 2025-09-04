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
        NavigationStack {
            Group {
                if sessions.isEmpty {
                    EmptyStateView(addSessionAction: {})
                } else {
                    
                }
            }
            .navigationTitle("Stats des sessions")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    StatsView()
}
