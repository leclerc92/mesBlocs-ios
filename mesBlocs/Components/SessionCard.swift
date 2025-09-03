import SwiftUI

struct SessionCard: View {
    
    let session: SessionDto
    
    private var completionRate: Double {
        session.perf.nbBlocs > 0 ?
        Double(session.perf.nbBlocTerminate) / Double(session.perf.nbBlocs) : 0.0
    }
    
    private var statisticsSection: some View {
        HStack(spacing: 0) {
            StatisticItem(
                icon: "trophy.fill",
                iconColor: .yellow,
                title: "Score",
                value: String(format: "%.1f", session.perf.score)
            )
            
            StatisticsSeparator()
            
            StatisticItem(
                icon: "cube.fill",
                iconColor: .blue,
                title: "Blocs",
                value: "\(session.perf.nbBlocTerminate)/\(session.perf.nbBlocs)"
            )
            
            StatisticsSeparator()
            
            StatisticItem(
                icon: "plusminus",
                iconColor: .orange,
                title: "Niveau",
                value: String(format: "%.1f", session.perf.averageLevel)
            )
        }
        .padding()
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
    
    var body: some View {
        VStack(spacing: 0) {
            SessionHeader(date: session.date)
            statisticsSection
            PerformanceProgress(completionRate: completionRate)
        }
        .background(cardBackground)
        .overlay(cardBorder)
    }
    
    
}

#Preview {
    
    VStack{
        let p = SessionPerformanceModele(
            score: 120,
            nbBlocs: 10,
            nbBlocTerminate: 8,
            nbBlocsTry: 3,
            nbBlocsDA: 8,
            nbBlocsDE: 2,
            nbBlocsFlashed: 6,
            nbTry: 3,
            levelMax: 7,
            levelMin: 3,
            averageLevel: 5.6,
            averageLevelFlashed: 6.4,
            averageLevelTry: 3.2
        )
        let s = SessionDto(date: Date.now, perf: p)
        
        SessionCard(session: s)
    }.padding()
    
    
}

