//
//  ViewExtension.swift
//  CelestialDistancePredict
//
//  Created by Steven Wijaya on 04.06.2023.
//

import SwiftUI

extension View {
    
    func bandTextFieldStyle(_ color: Color) -> some View {
        self.modifier(BandTextField(color: color))
    }
    
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
