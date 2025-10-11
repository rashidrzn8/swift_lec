//
//  ContentView.swift
//  week02
//
//  Created by Rashid Ahamed on 11/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var unitPrice:String = ""
    @State private var quantity:String = ""
    @State private var total:String = ""
    @State private var resMessage:String = ""
    @State private var errorMessage:String = ""
    var isDisabled:Bool {
        return unitPrice.isEmpty || quantity.isEmpty
    }
    
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.red,.white]) , startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Text("Calculator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                VStack{
                    Image(systemName: "function")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    HStack{
                        Text("Unit Price: ")
                            .font(.system(size: 25))
                        TextField("Unit Price", text: $unitPrice)
                            .textFieldStyle(.roundedBorder)
                            .onChange(of: unitPrice) {oldValue,newValue in
                                resMessage = ""
                                errorMessage=""
                            }
                            .keyboardType(.numberPad)
                    }.padding()
                    HStack{
                        Text("Quantity: ")
                            .font(.system(size: 25))
                        TextField("Quantity", text: $quantity)
                            .textFieldStyle(.roundedBorder)
                            .onChange(of: quantity) {oldValue,newValue in
                            resMessage = ""
                            errorMessage=""
                            }.keyboardType(.numberPad)
                    }.padding()
                    
                    Button("Calculate"){
                       if let doubleUnitPrice = Double(unitPrice), let doubleQty = Double(quantity)
                        {
                           let result = doubleUnitPrice * doubleQty
                           resMessage = "Totoal is \(result)"
                       }else{
                           errorMessage = "erros"
                       }
                    }
                    .tint(.purple)
                    .buttonStyle(.borderedProminent)
                    .disabled(isDisabled)
                    
                    Text(resMessage)
                        .foregroundStyle(.white)
                        .font(.system(size: 30))
                    Text(errorMessage)
                        .foregroundStyle(.white)
                        .font(.system(size: 30))
                }
                Spacer()
            
            }
            
        }
    }
}

#Preview {
    ContentView()
}
