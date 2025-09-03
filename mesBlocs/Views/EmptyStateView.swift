//
//  EmptyStateView.swift
//  mesBlocs
//
//  Created by clement leclerc on 03/09/2025.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
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
}

#Preview {
    EmptyStateView()
}
