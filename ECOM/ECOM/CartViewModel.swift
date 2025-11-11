//
//  CartViewModel.swift
//  ECOM
//
//  Created by Rashid Ahamed on 8/11/25.
//

import Foundation
import Observation

@Observable

class CartViewModel {
    
    var cartItems: [CartItem] = []
    
    var total: Double {
        cartItems.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
    
    
    func addToCart(product:Product) {
        if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(product: product, quantity: 1))
        }
    }
    
    func removeFromCart(product:Product) {
        if let index = cartItems.firstIndex(where: {$0.product.id == product.id}){
            if cartItems[index].quantity > 1 {
                cartItems[index] .quantity -= 1
            }else{
                cartItems.remove(at: index)
            }
        }
    }
    
    func clearCart() {
            cartItems.removeAll()
        }

}
