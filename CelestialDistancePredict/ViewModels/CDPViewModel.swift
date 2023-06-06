//
//  CDPViewModel.swift
//  CelestialDistancePredict
//
//  Created by Steven Wijaya on 06.06.2023.
//

import Foundation

final class CDPViewModel: ObservableObject {
    
    @Published var redshift: Double = 0.0
    @Published var distance: Double = 0.0
    @Published var unit: String = ""
    
    func predict(ug: String, gr: String, ri: String, iz: String) {
        let jsonDataParams: Dictionary = [
            "ug": ug,
            "gr": gr,
            "ri": ri,
            "iz": iz
        ]
        
        NetworkManager.getData(url: "http://127.0.0.1:5000/predict", parameter: jsonDataParams, dataKind: PredictionResult.self) { data in
            DispatchQueue.main.async { [self] in
                print(data)
                redshift = data.redshift
                distance = data.getDistance()
                unit = data.getUnit()
            }
        }
    }
}
