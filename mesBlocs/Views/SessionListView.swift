//
//  SessionListView.swift
//  mesBlocs
//
//  Created by clement leclerc on 03/09/2025.
//

import SwiftUI
import SwiftData

struct SessionListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \SessionModele.date, order: .reverse)
    private var sessions: [SessionModele]
    
    var body: some View {
        Group {
            if sessions.isEmpty {
                EmptyStateView(addSessionAction: {})
            } else {
                sessionListContent
            }
        }
        .navigationTitle("Mes Sessions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Private Views
private extension SessionListView {
    
    var sessionListContent: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(sessionDtos) { sessionDto in
                    SessionCard(session: sessionDto)
                        .padding(.horizontal)
                }
            }
            .padding(.top, 8)
        }
        .refreshable {
            // SwiftData se rafraîchit automatiquement
        }
    }
        
    var sessionDtos: [SessionDto] {
        sessions.map { convertToDto(session: $0) }
    }
}

#Preview {
    SessionListView()
        .modelContainer(for: [SessionModele.self, BlocModel.self], inMemory: true)
}
