//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Atonbara Diete-Koki on 1/23/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    var tempTypes = ["celsius", "farenheit", "kelvin"]
    @State var inputTemp = "celsius"
    @State var outputTemp = "celsius"
    @State var inputValue: Double = 0.0
    var outputValue: Double {
        var preconvertedCelsiusVal: Double
        
        if inputTemp == "celsius" {
           preconvertedCelsiusVal = Double(inputValue)
        }
        else if inputTemp == "farenheit" {
            preconvertedCelsiusVal = Double((inputValue - 32) * 5/9)
        }
        else {
            preconvertedCelsiusVal = Double(inputValue - 273.15)
        }
        
        if outputTemp == "celsius" {
            return preconvertedCelsiusVal
        }
        
        else if outputTemp == "farenheit" {
            return (preconvertedCelsiusVal * 9 / 5) + 32
        }
        
        else {
            return preconvertedCelsiusVal + 273.15
        }
    }
    
    
    var body: some View {
        NavigationView{
            Form {
                
                VStack {
                    Picker("input temp unit", selection: $inputTemp){
                        ForEach (tempTypes, id: \.self){
                            Text($0)
                        }
                    }
                    Picker("output temp unit", selection: $outputTemp){
                        ForEach (tempTypes, id: \.self){
                            Text($0)
                        }
                    }
                }
                var outputValueString = String(format: "%.0f", outputValue)
                HStack {
                    TextField("Enter your value", value: $inputValue, format: .number)
                    Text("Your answer is \(outputValueString)")
                }
                
            }.navigationTitle("Temperature Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
