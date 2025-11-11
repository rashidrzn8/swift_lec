//
//  ProductViewModel.swift
//  ECOM
//
//  Created by Rashid Ahamed on 8/11/25.
//

import Foundation
import Observation

@Observable
class ProductViewModel {
    
    var products: [Product] = []
    
    init () {
        loadProducts()
    }
    
    func loadProducts() {
        products = [
            Product(name: "Apple iPhone 13 Pro Max", price: 1099.99, image: "iphone13promax", description: "Apple iPhone 13 Pro Max (64GB) - Space Gray"),
            Product(name: "Apple iPhone 13 Pro", price: 999.99, image: "iphone13pro", description: "Apple iPhone 13 Pro (128GB) - Space Gray"),
            
        ]
    }
    
    
}

