//
//  ContentView.swift
//  week3
//
//  Created by Rashid Ahamed on 11/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var weight:String = ""
    @State private var length:String = ""
    @State private var depth:String = ""
    @State private var width:String = ""
    @State private var resultText:String = ""
    @State private var errorText:String = ""
    var isDisable:Bool  {
      return weight.isEmpty || length.isEmpty || depth.isEmpty || width.isEmpty
    }
    
    var body: some View {
        VStack {
            Text("Parcel Cost Calculator")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding()
            HStack{
                Text("Weight: ")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                TextField("Enter weight", text: $weight)
                    .font(.system(size: 20))
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                    .onChange(of: weight, {oldValue, newValue in
                            resultText = ""
                            errorText = ""
                    })
            }.padding()
            VStack{
                HStack{
                    Text("Length: ")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    TextField("Enter Length", text: $length)
                        .textFieldStyle(.roundedBorder)
                        .onChange(of: length, {oldValue, newValue in
                                resultText = ""
                                errorText = ""
                        })
                }.padding()
                HStack{
                    Text("Depth: ")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    TextField("Enter Depth", text: $depth)
                        .textFieldStyle(.roundedBorder)
                        .onChange(of: depth, {oldValue, newValue in
                                resultText = ""
                                errorText = ""
                        })

                }.padding()
                HStack{
                    Text("Width: ")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    TextField("Enter Width", text: $width)
                        .textFieldStyle(.roundedBorder)
                        .onChange(of: width, {oldValue, newValue in
                                resultText = ""
                                errorText = ""
                        })
                }.padding()
            }
            
            Button("Calculate Cost") {
                guard
                    let weightCharge = Double(weight),
                    let lengthValue = Double(length),
                    let depthValue = Double(depth),
                    let widthValue = Double(width)
                else {
                    errorText = "⚠️ Please enter valid numbers for all fields"
                    resultText = ""
                    return
                }

                let volumeCharge = lengthValue * depthValue * widthValue
                let cost = (volumeCharge / 1000 * 0.10) + (weightCharge * 0.50)
                if cost < 4 {
                    resultText = "⚠️ Minimum cost should be Rs 4.00"
                } else {
                    resultText = "💰 The cost is: Rs \(String(format: "%.2f", cost))"
                }

                errorText = ""
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .tint(.purple)
           .disabled(isDisable)
            VStack{
                Text(resultText)
                    .foregroundStyle(.green)
                    .font(.system(size: 16))
                Text(errorText)
                    .foregroundStyle(.red)
                    .font(.system(size: 16))
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    ContentView()
}
