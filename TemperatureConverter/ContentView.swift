//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Atonbara Diete-Koki on 1/23/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    //selectable temperature types
    var tempTypes = ["celsius", "farenheit", "kelvin"]
    
    //input temp type
    @State var inputTemp = "celsius"
    
    //output temp type
    @State var outputTemp = "celsius"
    
    //input temp value
    @State var inputValue: Double = 0.0
    
    //output temp value (computed property)
    var outputValue: Double {
        var preconvertedCelsiusVal: Double
        //converting all input to celsius
        if inputTemp == "celsius" {
           preconvertedCelsiusVal = Double(inputValue)
        }
        else if inputTemp == "farenheit" {
            preconvertedCelsiusVal = Double((inputValue - 32) * 5/9)
        }
        else {
            preconvertedCelsiusVal = Double(inputValue - 273.15)
        }
        
        //converting input from celsius to desired type and returning
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
                    //input temp type picker
                    Picker("input temp unit", selection: $inputTemp){
                        ForEach (tempTypes, id: \.self){
                            Text($0)
                        }
                    }
                    
                    //output temp type picker
                    Picker("output temp unit", selection: $outputTemp){
                        ForEach (tempTypes, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                //formatting output value to be to no dp
                var outputValueString = String(format: "%.0f", outputValue)
                
                //HStack showing input and output
                HStack {
                    TextField("Enter your value", value: $inputValue, format: .number)
                    Text("Your answer is \(outputValueString)")
                }
                
            }.navigationTitle("Temperature Converter")//nav title
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
