//
//  PredictionResult.swift
//  CelestialDistancePredict
//
//  Created by Steven Wijaya on 04.06.2023.
//

import Foundation

struct PredictionResult: Codable {
    var redshift: Double
    var distance: Double
    
    func getDistance() -> Double {
        let ly: Double = getDistanceLY()
        print(ly)
        if ly >= 1_000_000_000 {
            return convertBillion(ly)
        } else if ly < 1_000_000_000 && ly >= 1_000_000 {
            return convertMillion(ly)
        } else {
            return ly
        }
    }
    
    func getUnit() -> String {
        let ly: Double = getDistanceLY()
        if ly >= 1_000_000_000 {
            return "billion"
        } else if ly < 1_000_000_000 && ly >= 1_000_000 {
            return "million"
        } else {
            return ""
        }
    }
    
    private func getDistanceLY() -> Double {
        distance * Constants.MpcToLy
    }
    
    private func convertMillion(_ ly: Double) -> Double {
        let mly: Double = ly / 1_000_000
        return round(mly * 100.0) / 100.0
    }
    
    private func convertBillion(_ ly: Double) -> Double {
        let bly: Double = ly / 1_000_000_000
        return round(bly * 100.0) / 100.0
    }
}
