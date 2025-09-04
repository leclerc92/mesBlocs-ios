//
//  EmptyStateView.swift
//  mesBlocs
//
//  Created by clement leclerc on 03/09/2025.
//

import SwiftUI

struct EmptyStateView: View {
    
    let addSessionAction: () -> Void
    
    var body: some View {
        if #available(iOS 26.0, *) {
            glassVersionView
        } else {
            // Version fallback pour iOS < 26
        }
    }
    
    // MARK: - iOS 26+ Liquid Glass Version
    @available(iOS 26.0, *)
    private var glassVersionView: some View {
        GlassEffectContainer(spacing: 30.0) {
            VStack(spacing: 30) {
                
                Spacer()
                
                // Icône avec effet glass
                Image(systemName: "figure.climbing")
                    .font(.system(size: 80))
                    .foregroundColor(.orange)
                    .frame(width: 120, height: 120)
                    .glassEffect(.regular.tint(.orange.opacity(0.2)).interactive(), in: .circle)
                
                VStack(spacing: 25) {
                    // Titre avec effet glass
                    Text("Aucune session")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding()
                        .glassEffect(.regular, in: .rect(cornerRadius: 16))
                    
                    // Description avec effet glass subtil
                    Text("Commencez votre première session d'escalade pour voir vos performances ici")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding()
                        .glassEffect(.regular.tint(.white.opacity(0.1)), in: .rect(cornerRadius: 20))
                }
                
                Spacer()
                
                // Bouton avec véritable effet Liquid Glass
                Button {
                    addSessionAction()
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                        Text("Nouvelle session")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.orange)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 18)
                    .glassEffect(.regular.tint(.orange.opacity(0.3)).interactive(), in: .rect(cornerRadius: 20))
                }
            }
            .padding()
        }
    }
}
    

#Preview {
    EmptyStateView(addSessionAction: {})
}
