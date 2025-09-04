//
//  PerformanceCalcul.swift
//  mesBlocs-app
//
//  Created by clement leclerc on 12/08/2025.
//

import Foundation

func calculateBlocScore(
    level:Int,
    nbTry:Int,
    DE:Bool,
    terminate:Bool
) -> Double {
    
    // Score de base : progression exponentielle pour refléter la difficulté croissante
    let baseScore = pow(Double(level), 1.3)
    
    // Bonus/Malus pour les essais : plus équitable avec diminishing returns
    let tryMultiplier = max(0.3, 1.0 - (Double(nbTry - 1) * 0.15))
    
    // Bonus pour dévers
    let deversBonus: Double = DE ? 1.25 : 1.0
    
    // Bonus pour réussite (plus significatif)
    let completionBonus: Double = terminate ? 1.5 : 0.8
    
    return baseScore * tryMultiplier * deversBonus * completionBonus
}

func calculSessionPerformance(blocs: [BlocDto]) -> SessionPerformanceModele {
    
    let flashedBlocs: [BlocDto] = blocs.filter { $0.terminate && $0.nbTry == 1}
    let retryedBlocs: [BlocDto] = blocs.filter { $0.nbTry > 1}

    
    let totalScore = blocs.reduce(0.0) { total, bloc in
        return total + calculateBlocScore(
            level: bloc.level,
            nbTry: bloc.nbTry,
            DE: bloc.DE,
            terminate: bloc.terminate
        )
    }
    
     
    
    let nbTry = blocs.reduce(0) { total, bloc in
        return total + bloc.nbTry
    }
    
    let averageLevel = blocs.count > 0 ?
    Double(blocs.reduce(0) { $0 + $1.level }) / Double(blocs.count) : 0.0
    
    let averageLevelFlashed = flashedBlocs.count > 0 ?
    Double(flashedBlocs.reduce(0) { $0 + $1.level }) / Double(flashedBlocs.count) : 0.0
    
    let averageLevelTry = retryedBlocs.count > 0 ?
    Double(retryedBlocs.reduce(0) { $0 + $1.level }) / Double(retryedBlocs.count) : 0.0
    
        
    return SessionPerformanceModele(
        score: totalScore,
        nbBlocs: blocs.count,
        nbBlocTerminate: blocs.filter { $0.terminate }.count,
        nbBlocsTry: retryedBlocs.count,
        nbBlocsDA: blocs.filter { !$0.DE }.count,
        nbBlocsDE: blocs.filter { $0.DE }.count,
        nbBlocsFlashed: flashedBlocs.count,
        nbTry:nbTry,
        levelMax: blocs.map { $0.level }.max() ?? 0,
        levelMin: blocs.map { $0.level }.min() ?? 0,
        averageLevel:averageLevel,
        averageLevelFlashed: averageLevelFlashed,
        averageLevelTry: averageLevelTry
    
    )
}


func calculGlobalSessionsPerformance(sessions: [SessionDto]) -> GlobalSessionPerformanceModel {
    
    let averageScore = sessions.count > 0 ?
    Double(sessions.reduce(0) { $0 + $1.perf.score }) / Double(sessions.count) : 0.0
    
    let nbBlocs =  sessions.reduce(0) { total, session in
        return total + session.perf.nbBlocs
    }
    
    return GlobalSessionPerformanceModel(
        averageScore: averageScore,
        medianScore: 0,
        nbSessions: sessions.count,
        nbBlocs: nbBlocs
    )
    
}
