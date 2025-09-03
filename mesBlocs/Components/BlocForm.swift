//
//  BlocForm.swift
//  mesBlocs-app
//
//  Created by clement leclerc on 12/08/2025.
//

import SwiftUI

struct BlocForm: View {
    
    @State var bloc: BlocDto
    let onUpdate: (BlocDto) -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            BlocFormHeader(score: bloc.score)
            
            FormSection {
                LevelSelector(level: levelBinding)
            }
            
            FormSection {
                TriesSelector(tries: triesBinding)
            }
            
            FormSection {
                VStack(spacing: 16) {
                    HStack {
                        Text("Options")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                    }
                    
                    OptionToggle(
                        icon: "mountain.2",
                        activeIcon: "mountain.2.fill",
                        title: "Dévers",
                        description: "Bloc en surplomb",
                        activeColor: .orange,
                        isOn: deversBinding
                    )
                    
                    Divider()
                    
                    OptionToggle(
                        icon: "checkmark.circle",
                        activeIcon: "checkmark.circle.fill",
                        title: "Terminé",
                        description: "Bloc réussi",
                        activeColor: .green,
                        isOn: terminateBinding
                    )
                }
            }
        }
        .padding(20)
        .background(cardBackground)
        .overlay(cardBorder)
    }
    
    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color(.systemBackground))
            .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
    
    private var cardBorder: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
    }
    
    private var levelBinding: Binding<Int> {
        Binding(
            get: { bloc.level },
            set: {
                bloc.level = $0
                updateScore()
                onUpdate(bloc)
            }
        )
    }
    
    private var triesBinding: Binding<Int> {
        Binding(
            get: { bloc.nbTry },
            set: {
                bloc.nbTry = $0
                updateScore()
                onUpdate(bloc)
            }
        )
    }
    
    private var deversBinding: Binding<Bool> {
        Binding(
            get: { bloc.DE },
            set: {
                bloc.DE = $0
                updateScore()
                onUpdate(bloc)
            }
        )
    }
    
    private var terminateBinding: Binding<Bool> {
        Binding(
            get: { bloc.terminate },
            set: {
                bloc.terminate = $0
                updateScore()
                onUpdate(bloc)
            }
        )
    }
    
    private func updateScore() {
        bloc.score = calculateBlocScore(
            level: bloc.level,
            nbTry: bloc.nbTry,
            DE: bloc.DE,
            terminate: bloc.terminate
        )
    }
}

#Preview {
    @Previewable @State var bloc = BlocDto(
        level: 7,
        terminate: true,
        DE: false,
        nbTry: 3,
        score: 0
    )
    
    BlocForm(bloc: bloc) { updatedBloc in
        print("Bloc updated: \(updatedBloc)")
    }
    .padding()
}



