//
//  CDPMainView.swift
//  CelestialDistancePredict
//
//  Created by Steven Wijaya on 04.06.2023.
//

import SwiftUI

struct CDPMainView: View {
    
    @State private var ug: String = ""
    @State private var gr: String = ""
    @State private var ri: String = ""
    @State private var iz: String = ""
    
    @StateObject private var vm: CDPViewModel = CDPViewModel()
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Spacer()
                    Group {
                        Text("Enter u-g band value")
                        HStack {
                            TextField("u-g value", text: $ug).bandTextFieldStyle(Color.purple)
                            RandomButton(randomizer: generateRandomBandValue, band: .ug, value: $ug)
                        }
                    }
                    Group {
                        Text("Enter g-r band value")
                        HStack {
                            TextField("g-r value", text: $gr).bandTextFieldStyle(Color.green)
                            RandomButton(randomizer: generateRandomBandValue, band: .gr, value: $gr)
                        }
                    }
                    Group {
                        Text("Enter r-i band value")
                        HStack {
                            TextField("r-i value", text: $ri).bandTextFieldStyle(Color.red)
                            RandomButton(randomizer: generateRandomBandValue, band: .ri, value: $ri)
                        }
                    }
                    Group {
                        Text("Enter i-z band value")
                        HStack {
                            TextField("i-z value", text: $iz).bandTextFieldStyle(Color.infrared)
                            RandomButton(randomizer: generateRandomBandValue, band: .iz, value: $iz)
                        }
                    }
                    HStack {
                        Spacer()
                        Button {
                            vm.predict(ug: ug, gr: gr, ri: ri, iz: iz)
                        } label: {
                            predictButton
                        }
                        Spacer()
                    }.padding(.top)
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Predicted object's:").font(.title)
                        Text("Redshift: \(vm.redshift, specifier: "%.3f")").font(.title3)
                        Text("Distance: \(vm.distance, specifier: "%.2f") \(vm.unit) light years").font(.title3)
                    }
                    Spacer()
                }
            }
            .monospaced()
            .keyboardType(.decimalPad)
            .padding()
            .navigationTitle("Predict Distance")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "questionmark.circle")
                    }
                }
                ToolbarItem(placement: .keyboard) {
                    Button {
                        dismissKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                CDPInformationView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CDPMainView()
    }
}

struct RandomButton: View {
    
    var randomizer: (BandType) -> String
    var band: BandType
    @Binding var value: String
    
    var body: some View {
        Button {
            value = self.randomizer(band)
        } label: {
            Image(systemName: "dice")
        }
    }
}

extension CDPMainView {
    var predictButton: some View {
        Text("Predict")
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(Color.infrared)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
