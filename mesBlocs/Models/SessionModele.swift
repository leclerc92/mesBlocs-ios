import Foundation
import SwiftData

@Model
class SessionModele {
    var date: Date

    @Relationship(deleteRule: .cascade, inverse: \BlocModel.session)
    var blocs: [BlocModel] = []
    
    init(date: Date) {
        self.date = date
    }
}

struct SessionPerformanceModele {
    
    var score: Double
    var nbBlocs: Int
    var nbBlocTerminate: Int
    var nbBlocsTry: Int
    var nbBlocsDA: Int
    var nbBlocsDE: Int
    var nbBlocsFlashed: Int
    var nbTry:Int
    var levelMax: Int
    var levelMin: Int
    var averageLevel: Double
    var averageLevelFlashed: Double
    var averageLevelTry: Double
}

struct GlobalSessionPerformanceModel {
    var averageScore: Double
    var medianScore: Double
    var nbSessions: Int
    var nbBlocs: Int
}

struct SessionDto: Identifiable {
    var id = UUID()
    var date: Date
    var perf: SessionPerformanceModele
}

func convertToDto (session:SessionModele) -> SessionDto {
    return SessionDto(
        date: session.date,
        perf: calculSessionPerformance(
            blocs: session.blocs
        )
    )
}
