import Foundation
import SwiftData

@Model
class BlocModel {
    
    var level : Int
    var terminate: Bool
    var DE: Bool
    var nbTry: Int
    var session: SessionModele?
        
    init(level: Int, terminate: Bool, DE: Bool, nbTry: Int) {
        self.level = level
        self.terminate = terminate
        self.DE = DE
        self.nbTry = nbTry
    }
}


struct BlocDto: Identifiable, Codable, Equatable {
    var id = UUID()
    var level : Int
    var terminate: Bool
    var DE: Bool
    var nbTry: Int
    var score: Double
    
    // Implémentation d'Equatable (exclut la session de la comparaison)
    static func == (lhs: BlocDto, rhs: BlocDto) -> Bool {
        return lhs.id == rhs.id &&
               lhs.level == rhs.level &&
               lhs.terminate == rhs.terminate &&
               lhs.DE == rhs.DE &&
               lhs.nbTry == rhs.nbTry &&
               lhs.score == rhs.score
    }
}

func convertToModel(dto:BlocDto) -> BlocModel {
    return BlocModel(
            level: dto.level,
            terminate: dto.terminate,
            DE: dto.DE,
            nbTry: dto.nbTry
    )
}

func convertToDto(model:BlocModel) -> BlocDto {
    return BlocDto (
        level: model.level,
        terminate: model.terminate,
        DE: model.DE,
        nbTry: model.nbTry,
        score: calculateBlocScore(level: model.level, nbTry: model.nbTry, DE: model.DE, terminate: model.terminate),
    )
}
