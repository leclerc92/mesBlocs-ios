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
        NavigationView {
            Group {
                if sessions.isEmpty {
                    emptyStateView
                } else {
                    sessionListContent
                }
            }
            .navigationTitle("Mes Sessions")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // TODO: Navigate to NewSessionView
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
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
    
    var emptyStateView: some View {
        VStack(spacing: 20) {
            Image(systemName: "figure.climbing")
                .font(.system(size: 60))
                .foregroundColor(.orange)
            
            Text("Aucune session")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("Commencez votre première session d'escalade pour voir vos performances ici")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Button {
                // TODO: Navigate to NewSessionView
            } label: {
                Label("Nouvelle session", systemImage: "plus")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(12)
            }
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
