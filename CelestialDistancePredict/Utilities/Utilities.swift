//
//  Utilities.swift
//  CelestialDistancePredict
//
//  Created by Steven Wijaya on 04.06.2023.
//

import Foundation

enum BandType {
    case ug
    case gr
    case ri
    case iz
}

func generateRandomBandValue(band: BandType) -> String {
    switch band {
    case .ug:
        let u: Double = Double.random(in: 10.61...19.60)
        let g: Double = Double.random(in: 9.67...20.00)
        let ug: Double = u - g
        return String(ug)
    case .gr:
        let g: Double = Double.random(in: 9.67...20.00)
        let r: Double = Double.random(in: 9.01...31.99)
        let gr: Double = g - r
        return String(gr)
    case .ri:
        let r: Double = Double.random(in: 9.01...31.99)
        let i: Double = Double.random(in: 8.85...32.14)
        let ri: Double = r - i
        return String(ri)
    case .iz:
        let i: Double = Double.random(in: 8.85...32.14)
        let z: Double = Double.random(in: 8.95...29.38)
        let iz: Double = i - z
        return String(iz)
    }
}
