//
//  CDPInformationView.swift
//  CelestialDistancePredict
//
//  Created by Steven Wijaya on 06.06.2023.
//

import SwiftUI

struct CDPInformationView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Group {
                    Text("About app")
                        .bold()
                        .font(.title)
                        .padding(.bottom)
                    Text("This app is used to predict celestial object (Star or Galaxy) redshift value and it's distance from us. Our prediction is based on Machine Learning model which is Decission Tree Regressor. You can check how we trained our model on our GitHub repository.").monospaced()
                    Link(destination: URL(string: "https://github.com/Steven2110/CelestialDistancePredict-Model")!) {
                        Image("github-mark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                        Text("ML Model").foregroundColor(.black)
                    }
                }.monospaced()
                Divider()
                    .frame(height: 0.75)
                    .overlay(.gray)
                Group {
                    Text("How to use the app")
                        .bold()
                        .font(.title)
                        .padding(.bottom)
                    Text("1.\tEnter all the value of each color band (floating point number only) or use the random button (dice) that are located right next to the text field")
                    TextFieldComponents()
                    Text("2.\tPress the Predict button that are located under all the text fields to start the prediction.")
                    ButtonComponent()
                    Text("3.\tYou will get the result of that object below the Predict button.").padding(.bottom)
                    ResultComponent()
                    HStack(alignment: .firstTextBaseline) {
                        Text("  ◉ ")
                        Text("Redshift value of an object which is the increase in the wavelength, and corresponding decrease in the frequency and photon energy, of electromagnetic radiation (such as light). From the redshift value we can calculate it's distance.").multilineTextAlignment(.leading)
                    }.padding(.bottom)
                    HStack(alignment: .firstTextBaseline) {
                        Text("  ◉ ")
                        Text("Distance measure the distance of an object from earth, by calculating using Hubble's distance formula from redshift value. The distance is calculated in light years, which is the distance light travel in a year (9.46 trillion km).").multilineTextAlignment(.leading)
                    }.padding(.bottom)
                }.monospaced()
            }
        }.padding()
    }
}

struct CDPInformationView_Previews: PreviewProvider {
    static var previews: some View {
        CDPInformationView()
    }
}

struct TextFieldComponents: View {
    
    @State private var ug: String = "1.332"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Enter u-g band value")
            HStack {
                TextField("u-g value", text: $ug).bandTextFieldStyle(Color.purple)
                RandomButton(randomizer: generateRandomBandValue, band: .ug, value: $ug)
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray)
        }
    }
}

struct ButtonComponent: View {
    var body: some View {
        HStack {
            Spacer()
            Button {
                
            } label: {
                CDPMainView().predictButton
            }
            Spacer()
        }
    }
}

struct ResultComponent: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Predicted object's:").font(.title)
            Text("Redshift: \(4.088, specifier: "%.3f")").font(.title3)
            Text("Distance: \(57.10, specifier: "%.2f") billion light years").font(.title3)
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray)
        }
    }
}
