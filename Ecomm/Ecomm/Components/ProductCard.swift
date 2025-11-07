//
//  ProductCard.swift
//  Ecomm
//
//  Created by Rashid Ahamed on 30/10/25.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartmanager: CartManager
    var product: Product
    var body: some View {
        ZStack{
            Color("kSecondary")
            ZStack(alignment: .bottomTrailing)
            {
                VStack(alignment: .leading){
                    
                    Image(product.image)
                        .resizable()
                        .frame(width: 165, height: 160)
                        .cornerRadius(12)
                    
                    Text(product.name)
                        .font(.headline)
                        .padding(.vertical,1)
                    Text(product.supllier)
                        .foregroundColor(.gray)
                        .font(.caption)
                        .padding(.vertical,1)
                    Text("$\(product.price)")
                        .font(.caption)
                        .fontWeight(.bold)
                    
                }
                    Button{
                        cartmanager.addToCart(product: product)
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundColor(Color("kPrimary"))
                            .frame(width: 35,height: 35)
                            .padding(.trailing)
                    }
                }
        }
        .frame(width: 185, height: 260)
        .cornerRadius(12)
    }
}

#Preview {
    ProductCard(product: productList[2])
        .environmentObject(CartManager())
}
