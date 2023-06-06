//
//  CustomModifiers.swift
//  CelestialDistancePredict
//
//  Created by Steven Wijaya on 04.06.2023.
//

import SwiftUI

struct BandTextField: ViewModifier {
    
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .padding(5)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(color))
    }
}
