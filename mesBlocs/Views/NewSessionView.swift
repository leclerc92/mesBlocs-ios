//
//  NewSessionView.swift
//  mesBlocs
//
//  Created by clement leclerc on 03/09/2025.
//

import SwiftUI
import _SwiftData_SwiftUI



@available(iOS 26.0, *)
struct NewSessionView: View {
    
    @State private var currentSession: SessionDto?
    @State private var blocsDtos: [BlocDto] = []
    @Environment(\.modelContext) private var modelContext

    
    // Navigation states
    @State private var isSessionCompleted = false
    @State private var showingSessionSummary = false
    
    
    var body: some View {
        Group {
            if currentSession == nil {
                EmptyStateView(addSessionAction: createNewSession)
            } else {
                VStack{
                    blocsFormsSection
                    buttonSection
                }
                
            }
        }
        .navigationTitle("Création d'une session")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var blocsFormsSection: some View {
        ScrollView {
            ForEach(blocsDtos) { dto in
                BlocForm(
                    bloc: dto,
                    onUpdate: {_ in }
                )
            }
        }.padding()
    }
    
    var buttonSection: some View {
        HStack {
            Button {
                
            } label: {
                Label("Valider", systemImage: "arrowshape.zigzag.right")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(12)
            }
            
            Button {
                addNewBloc()
            } label: {
                Label("ajouter un bloc", systemImage: "plus")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(12)
            }
        }.padding()
    }
    
    var sessionStatSection: some View {
        HStack {
            SessionCard(session: currentSession!)
        }
    }
    
    func createNewSession() {
        currentSession = SessionDto(date: Date.now, perf: calculSessionPerformance(blocs: blocsDtos))
        addNewBloc()
    }
    
    func addNewBloc() {
        
        let bloc:BlocDto = BlocDto(
            level: 3,
            terminate: false,
            DE: false,
            nbTry: 1,
            score: calculateBlocScore(level: 3, nbTry: 1, DE: false, terminate: false)
        )
        blocsDtos.append(bloc)
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        NewSessionView()
    } else {
        // Fallback on earlier versions
    }
}
