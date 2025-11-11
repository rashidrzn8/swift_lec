//
//  CartItem.swift
//  ECOM
//
//  Created by Rashid Ahamed on 8/11/25.
//

import Foundation

struct CartItem:Codable, Identifiable{
    let id = UUID()
    let product: Product
    var quantity: Int
}
