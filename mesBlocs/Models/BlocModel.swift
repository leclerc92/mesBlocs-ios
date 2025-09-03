//
//  BlocModel.swift
//  mesBlocs-app
//
//  Created by clement leclerc on 12/08/2025.
//

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
    var session: SessionModele? = nil // Ne pas sérialiser la session
    var score: Double
    
    // Custom coding keys pour exclure la session de la sérialisation
    enum CodingKeys: String, CodingKey {
        case id, level, terminate, DE, nbTry, score
    }
    
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
