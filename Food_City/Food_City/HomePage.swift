//
//  HomePage.swift
//  Food_City
//
//  Created by Rashid Ahamed on 25/10/25.
//

import SwiftUI

struct HomePage: View {
    
    @State private var goToCart = false
    @State private var selectedItems: [Order] = []
    
    
    
    var body: some View {
        
        NavigationStack{
            List {
                Products(imageUrl: "bananan", title: "Banana", price: 10)
                Products(imageUrl: "avacado", title: "avacado", price: 10)
                Products(imageUrl: "water",title: "water", price: 10)
                Products(imageUrl: "chicken",title: "chicken", price: 10)
                Products(imageUrl: "brocolli",title: "brocolli", price: 10)
            }
            Button("Checkout"){
                goToCart = true
            }
            .foregroundColor(.green)
            .background(Color.white)
            .listStyle(.plain)
            .padding(10)
            
            
            .navigationTitle("Buy Fresh Groceries")
            .navigationDestination(isPresented: $goToCart) {
                CartPage()
            }
            
        }
    }
}

#Preview {
    HomePage()
}

struct Products: View {
    
    @State private var quantity = 1
    var imageUrl:String
    var title:String
    var price:Double
    var body: some View {
        HStack{
            Image(imageUrl)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(12)
                .shadow(radius: 5)
                .padding(.vertical, 8)
            VStack{
                Text(title)
                    .padding(.bottom, 4)
                Text("\(price)")
            }
            Stepper("", value: $quantity, in: 1...10)
                .onChange(of: quantity) { newValue in
                                    let order = Order()
                                    onQuantityChange(order)
                                }                .padding()
            Text("\(quantity)")
        }
    }
}
