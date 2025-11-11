//
//  ProductListView.swift
//  ECOM
//
//  Created by Rashid Ahamed on 8/11/25.
//

import SwiftUI

struct ProductListView: View {
    @State private var productVM = ProductViewModel()
    @State private var cartVM = CartViewModel()
    
    var body: some View {
        NavigationStack {
            List(productVM.products) { product in
                ProductRowView(product: product, cartVM: cartVM)
            }
            .navigationTitle("🛒 Products")
            .toolbar {
                NavigationLink(destination: CartView(cartVM: cartVM)) {
                    Label("Cart", systemImage: "cart.fill")
                }
            }
        }
    }
}

#Preview {
    ProductListView()
}
