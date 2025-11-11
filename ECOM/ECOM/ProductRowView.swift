//
//  ProductRowView.swift
//  ECOM
//
//  Created by Rashid Ahamed on 8/11/25.
//

import SwiftUI

struct ProductRowView: View {
    let product: Product
    @Bindable var cartVM: CartViewModel
    
    var body: some View {
        HStack(spacing: 12) {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 3)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name)
                    .font(.headline)
                Text(product.description)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .bold()
            }
            Spacer()
            Button {
                cartVM.addToCart(product: product)
            } label: {
                Image(systemName: "plus.circle.fill")
                    .font(.title2)
                    .foregroundStyle(.blue)
            }
        }
        .padding(.vertical, 8)
    }
}


